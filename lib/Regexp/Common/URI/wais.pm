package Regex::Common::URI::wais;
use strict;
use warnings;
use Regex::Common               qw /pattern clean no_defaults/;
use Regex::Common::URI          qw /register_uri/;
use Regex::Common::URI::RFC1738 qw /$host $port
  $search $database $wtype $wpath/;

# VERSION

my $scheme = 'wais';
my $uri    = "(?k:(?k:$scheme)://(?k:$host)(?::(?k:$port))?/(?k:(?k:$database)"
  . "(?k:[?](?k:$search)|/(?k:$wtype)/(?k:$wpath))?))";

register_uri $scheme => $uri;

pattern
  name   => [qw (URI WAIS)],
  create => $uri,
  ;

1;

__END__

=pod

=head1 NAME

Regex::Common::URI::wais -- Returns a pattern for WAIS URIs.

=head1 SYNOPSIS

    use Regex::Common qw /URI/;

    while (<>) {
        /$RE{URI}{WAIS}/       and  print "Contains a WAIS URI.\n";
    }

=head1 DESCRIPTION

=head2 $RE{URI}{WAIS}

Returns a pattern that matches I<WAIS> URIs, as defined by RFC 1738.
WAIS URIs have the form:

    "wais:" "//" host [ ":" port ] "/" database
                      [ ( "?" search ) | ( "/" wtype "/" wpath ) ]

Under C<{-keep}>, the following are returned:

=over 4

=item $1

The complete URI.

=item $2

The I<scheme>.

=item $3

The I<hostname>.

=item $4

The I<port>, if given.

=item $5

The I<database>, followed by I<search> or I<wtype/wpath>, if given.

=item $6

The I<database>.

=item $7

The part following the I<database> if given, including the question mark
or slash.

=item $8

The I<search> part, if given.

=item $9

The I<wtype>, if given.

=item $10

The I<wpath>, if given.

=back

=head1 REFERENCES

=over 4

=item B<[RFC 1738]>

Berners-Lee, Tim, Masinter, L., McCahill, M.: I<Uniform Resource
Locators (URL)>. December 1994.

=back

=head1 SEE ALSO

L<Regex::Common::URI> for other supported URIs.

=head1 AUTHOR

Alceu Rodrigues de Freitas Junior <glasswalk3r@yahoo.com.br>

=head1 LICENSE and COPYRIGHT

This software is copyright (c) 2024 of Alceu Rodrigues de Freitas Junior,
glasswalk3r at yahoo.com.br

This file is part of regex-common project.

regex-commonis free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

regex-common is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with
regex-common. If not, see (http://www.gnu.org/licenses/).

The original project [Regex::Common](https://metacpan.org/pod/Regex::Common)
is licensed through the MIT License, copyright (c) Damian Conway
(damian@cs.monash.edu.au) and Abigail (regexp-common@abigail.be).

=cut
