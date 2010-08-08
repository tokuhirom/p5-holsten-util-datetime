package Holsten::Util::DateTime;
use perl5i::2;
use 5.00800;
our $VERSION = '0.01';
use parent qw/Exporter/;
use DateTime::Format::Strptime;
use DateTime::Util::DayOfWeek;
use DateTime::Event::Recurrence;

our @EXPORT = qw/strptime parse_date parse_datetime make_daily_list/;

# Usage: strptime('%Y-%m-%d' => '2010-08-08')
func strptime($pattern, $str) {
    state $tz = localtime->time_zone;

    # swap if illegal order
    ($pattern, $str) = ($str, $pattern) if $pattern !~ /%/ && $str =~ /%/;

    my $strp = DateTime::Format::Strptime->new(
        pattern   => $pattern,
        locale    => 'en_US',
        time_zone => $tz,
    );
    my $dt = $strp->parse_datetime($str);
    die "invalid date: $dt" if "$dt" eq '0001-01-01T00:00:00';
    return $dt;
}

func parse_date($str) {
    return strptime('%Y-%m-%d', $str);
}

func parse_datetime($str) {
    return strptime('%Y-%m-%d %H:%M:%S', $str);
}

func make_daily_list($d1, $d2) {
     my $daily_set = DateTime::Event::Recurrence->daily;
     my @list = $daily_set->as_list( start => [$d1, $d2]->min(), end => [$d1,$d2]->max() );
     return wantarray ? @list : \@list;
}

1;
__END__

=encoding utf8

=head1 NAME

Holsten::Util::DateTime -

=head1 SYNOPSIS

  use Holsten::Util::DateTime;

=head1 DESCRIPTION

Holsten::Util::DateTime is

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
