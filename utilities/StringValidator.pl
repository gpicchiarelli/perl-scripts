package StringValidator;

use strict;
use warnings;

sub is_email {
    my ($string) = @_;
    return $string =~ /^[a-zA-Z0-9_.+-]+\@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
}

sub is_url {
    my ($string) = @_;
    return $string =~ m{^https?://[a-zA-Z0-9.-]+(?:\.[a-zA-Z]{2,})+(?:/[a-zA-Z0-9._/?=&%-]*)?$};
}

sub is_ftp_url {
    my ($string) = @_;
    return $string =~ m{^ftp://[a-zA-Z0-9.-]+(?:/[a-zA-Z0-9._/?=&%-]*)?$};
}

sub is_file_url {
    my ($string) = @_;
    return $string =~ m{^file:///[a-zA-Z0-9._/-]+$};
}

sub is_data_url {
    my ($string) = @_;
    return $string =~ m{^data:[a-zA-Z0-9.-]+/[a-zA-Z0-9.-]+;base64,[A-Za-z0-9+/=]+$};
}

sub is_ipv4 {
    my ($string) = @_;
    return $string =~ /^((25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{1,2})\.){3}(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{1,2})$/;
}

sub is_ipv6 {
    my ($string) = @_;
    return $string =~ /^[a-fA-F0-9:]+(?:\:[a-fA-F0-9]+)*$/;
}

sub is_mac_address {
    my ($string) = @_;
    return $string =~ /^[0-9A-Fa-f]{2}(:[0-9A-Fa-f]{2}){5}$/;
}

sub is_uuid {
    my ($string) = @_;
    return $string =~ /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/;
}

sub is_phone_number {
    my ($string) = @_;
    return $string =~ /^\+?[0-9 ]{7,15}$/;
}

sub is_credit_card {
    my ($string) = @_;
    return $string =~ /^\d{13,19}$/;
}

sub is_date_iso8601 {
    my ($string) = @_;
    return $string =~ /^\d{4}-\d{2}-\d{2}$/;
}

sub is_time_24h {
    my ($string) = @_;
    return $string =~ /^(?:[01]\d|2[0-3]):[0-5]\d$/;
}

sub is_hex_color {
    my ($string) = @_;
    return $string =~ /^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/;
}

sub is_username {
    my ($string) = @_;
    return $string =~ /^[a-zA-Z0-9_]{3,20}$/;
}

sub is_zip_code {
    my ($string) = @_;
    return $string =~ /^\d{5}(-\d{4})?$/;
}

sub is_password_strong {
    my ($string) = @_;
    return $string =~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
}

sub is_html_tag {
    my ($string) = @_;
    return $string =~ /^<([a-zA-Z][a-zA-Z0-9]*)(\s[^>]*)?>.*<\/\1>$/;
}

sub is_base64 {
    my ($string) = @_;
    return $string =~ /^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$/;
}

sub is_sha256 {
    my ($string) = @_;
    return $string =~ /^[A-Fa-f0-9]{64}$/;
}

sub is_social_security_number {
    my ($string) = @_;
    return $string =~ /^\d{3}-\d{2}-\d{4}$/;
}

sub is_currency_format {
    my ($string) = @_;
    return $string =~ /^\$?\d+(,\d{3})*(\.\d{2})?$/;
}

sub is_iban {
    my ($string) = @_;
    return $string =~ /^[A-Z]{2}\d{2}[A-Z0-9]{1,30}$/;
}

sub is_codice_fiscale {
    my ($string) = @_;
    return $string =~ /^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$/;
}

1;
