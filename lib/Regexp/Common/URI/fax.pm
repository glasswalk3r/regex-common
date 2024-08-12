package Regex::Common::URI::fax;
use strict;
use warnings;
use Regex::Common               qw /pattern clean no_defaults/;
use Regex::Common::URI          qw /register_uri/;
use Regex::Common::URI::RFC2806 qw /$fax_subscriber
  $fax_subscriber_no_future/;

# VERSION

my $fax_scheme = 'fax';
my $fax_uri    = "(?k:(?k:$fax_scheme):(?k:$fax_subscriber))";
my $fax_uri_nf = "(?k:(?k:$fax_scheme):(?k:$fax_subscriber_no_future))";

register_uri $fax_scheme => $fax_uri;

pattern
  name   => [qw (URI fax)],
  create => $fax_uri;

pattern
  name   => [qw (URI fax nofuture)],
  create => $fax_uri_nf;

1;

__END__

=pod

=head1 NAME

Regex::Common::URI::fax -- Returns a pattern for fax URIs.

=head1 SYNOPSIS

    use Regex::Common qw /URI/;

    while (<>) {
        /$RE{URI}{fax}/       and  print "Contains a fax URI.\n";
    }

=head1 DESCRIPTION

=head2 $RE{URI}{fax}

Returns a pattern that matches I<fax> URIs, as defined by RFC 2806.
Under C<{-keep}>, the following are returned:

=over 4

=item $1

The complete URI.

=item $2

The scheme.

=item $3

The phone number, including any possible add-ons like ISDN subaddress,
a post dial part, area specifier, service provider, etc.

=back

=head2 C<$RE{URI}{fax}{nofuture}>

As above (including what's returned by C<{-keep}>), with the exception
that I<future extensions> are not allowed. Without allowing
those I<future extensions>, it becomes much easier to check a URI if
the correct syntax for post dial, service provider, phone context,
etc has been used - otherwise the regex could always classify them
as a I<future extension>.

=head1 REFERENCES

=over 4

=item B<[RFC 1035]>

Mockapetris, P.: I<DOMAIN NAMES - IMPLEMENTATION AND SPECIFICATION>.
November 1987.

=item B<[RFC 2396]>

Berners-Lee, Tim, Fielding, R., and Masinter, L.: I<Uniform Resource
Identifiers (URI): Generic Syntax>. August 1998.

=item B<[RFC 2806]>

Vaha-Sipila, A.: I<URLs for Telephone Calls>. April 2000.

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
