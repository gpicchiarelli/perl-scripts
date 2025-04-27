#!/usr/bin/perl

use strict;
use warnings;
use File::Copy qw(copy);
use IPC::Open3;
use Symbol 'gensym';
use Sys::Hostname;

# CONFIGURAZIONI
my $admin_user     = "secureadmin";
my $ssh_port       = 2288;
my $backup_dir     = "/root/super_hardening_backup";
my $random_pwd_len = 40;

# Detezione sistema operativo
my $os = get_os();

# Verifica privilegi di root
die "Devi eseguire questo script come root.\n" if $> != 0;

# MAIN
print "\n[*] Avvio Super Hardening su $os...\n";
backup_files();

create_admin_user();
harden_ssh();
harden_root();
set_firewall();
restrict_system();
update_system();

print "\n[+] Hardening COMPLETATO. Tutte le modifiche sono salvate in $backup_dir.\n";
print "[!] Login solo tramite utente: $admin_user\n";

######################## FUNZIONI ########################

sub get_os {
    my $uname = `uname -s`;
    chomp($uname);
    if ($uname eq 'Linux') {
        return 'Linux';
    } elsif ($uname eq 'OpenBSD') {
        return 'OpenBSD';
    } elsif ($uname eq 'FreeBSD') {
        return 'FreeBSD';
    } else {
        die "Sistema operativo non supportato: $uname\n";
    }
}

sub generate_password {
    my @chars = ('A'..'Z', 'a'..'z', 0..9, qw(! @ $ % ^ & * ( ) _ + - =));
    my $password = '';
    $password .= $chars[rand @chars] for 1..$random_pwd_len;
    return $password;
}

sub backup_files {
    print "[*] Backup configurazioni critiche...\n";
    mkdir $backup_dir unless -d $backup_dir;
    my @files = (
        "/etc/ssh/sshd_config",
        "/etc/passwd",
        "/etc/group",
        "/etc/sudoers"
    );
    push @files, "/etc/pf.conf" if $os eq 'OpenBSD' || $os eq 'FreeBSD';
    foreach my $file (@files) {
        copy($file, $backup_dir) if -e $file;
    }
}

sub create_admin_user {
    print "[*] Creazione nuovo amministratore sicuro: $admin_user\n";
    my $password = generate_password();
    if ($os eq 'Linux') {
        system("useradd -m -s /bin/bash $admin_user");
    } elsif ($os eq 'OpenBSD' || $os eq 'FreeBSD') {
        system("adduser -batch -group wheel -shell /bin/sh -gecos 'Admin user' $admin_user");
    }
    run_command("echo '$admin_user:$password' | chpasswd");
    open(my $out, '>', "$backup_dir/${admin_user}_password.txt") or die "Impossibile scrivere la password: $!\n";
    print $out "Utente: $admin_user\nPassword: $password\n";
    close($out);
    chmod 0600, "$backup_dir/${admin_user}_password.txt";
    
    # Abilita sudo
    open(my $sudoers, '>>', '/etc/sudoers') or die "Impossibile modificare sudoers: $!\n";
    print $sudoers "$admin_user ALL=(ALL) NOPASSWD: ALL\n";
    close($sudoers);
}

sub harden_ssh {
    print "[*] Hardening configurazione SSH...\n";
    my $ssh_conf = "/etc/ssh/sshd_config";
    backup_file($ssh_conf);
    
    open(my $ssh, '>>', $ssh_conf) or die "Errore apertura sshd_config: $!\n";
    print $ssh "\n# Hardening SSH\n";
    print $ssh "Port $ssh_port\n";
    print $ssh "PermitRootLogin no\n";
    print $ssh "PasswordAuthentication yes\n";
    print $ssh "PermitEmptyPasswords no\n";
    print $ssh "UsePAM yes\n";
    print $ssh "AllowUsers $admin_user\n";
    close($ssh);

    restart_ssh();
}

sub restart_ssh {
    if ($os eq 'Linux') {
        run_command("systemctl restart sshd || service ssh restart");
    } elsif ($os eq 'OpenBSD' || $os eq 'FreeBSD') {
        run_command("/etc/rc.d/sshd restart");
    }
}

sub harden_root {
    print "[*] Blocco login root e disabilitazione password...\n";
    run_command("passwd -l root");
    run_command("usermod -L root") if $os eq 'Linux';
}

sub set_firewall {
    print "[*] Configurazione firewall...\n";
    if ($os eq 'Linux') {
        if (-x "/usr/sbin/nft") {
            system("nft add table inet filter");
            system("nft add chain inet filter input { type filter hook input priority 0; policy drop; }");
            system("nft add rule inet filter input ct state established,related accept");
            system("nft add rule inet filter input iif lo accept");
            system("nft add rule inet filter input tcp dport $ssh_port accept");
        } else {
            system("iptables -P INPUT DROP");
            system("iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT");
            system("iptables -A INPUT -i lo -j ACCEPT");
            system("iptables -A INPUT -p tcp --dport $ssh_port -j ACCEPT");
        }
    } elsif ($os eq 'OpenBSD' || $os eq 'FreeBSD') {
        open(my $pf, '>', '/etc/pf.conf') or die "Errore apertura pf.conf: $!\n";
        print $pf "block all\n";
        print $pf "pass in on egress proto tcp to port $ssh_port\n";
        print $pf "pass out all keep state\n";
        close($pf);
        system("pfctl -f /etc/pf.conf");
        system("pfctl -e");
    }
}

sub restrict_system {
    print "[*] Limitazione accessi e interpreti...\n";
    # Blocca interpreti non autorizzati per utenti non root/admin
    my @bins = qw(/usr/bin/python /usr/bin/perl /usr/bin/ruby /usr/bin/php);
    foreach my $bin (@bins) {
        if (-e $bin) {
            chmod 0750, $bin;
        }
    }

    # Blinda /home
    run_command("chmod -R go-rwx /home");
}

sub update_system {
    print "[*] Aggiornamento sistema...\n";
    if ($os eq 'Linux') {
        run_command("apt update && apt upgrade -y") if -x "/usr/bin/apt";
        run_command("dnf upgrade -y") if -x "/usr/bin/dnf";
        run_command("yum update -y") if -x "/usr/bin/yum";
    } elsif ($os eq 'OpenBSD') {
        run_command("syspatch");
        # Patching pkg
        run_command("pkg_add -u");
    } elsif ($os eq 'FreeBSD') {
        run_command("freebsd-update fetch install");
        run_command("pkg upgrade -y");
    }
}

sub run_command {
    my ($cmd) = @_;
    my $stderr = gensym;
    my $pid = open3(undef, \*PH, $stderr, $cmd);
    waitpid($pid, 0);
    my $exit_status = $? >> 8;
    if ($exit_status != 0) {
        while (<$stderr>) { warn "Errore: $_"; }
        die "Comando fallito: $cmd\n";
    }
}

sub backup_file {
    my ($file) = @_;
    if (-e $file) {
        system("cp $file $backup_dir/");
    }
}

