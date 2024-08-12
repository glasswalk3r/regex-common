package Regexp::Common::lingua;

use 5.10.0;

use strict;
use warnings;
no warnings 'syntax';

use Regexp::Common qw /pattern clean no_defaults/;

# VERSION

pattern
  name   => [qw /lingua palindrome -chars=[A-Za-z]/],
  create => sub {
    use re 'eval';
    my $keep = exists $_[1]->{-keep};
    my $ch   = $_[1]->{-chars};
    my $idx  = $keep ? "1:$ch" : "0:$ch";
    my $r    = "(??{\$Regexp::Common::lingua::pd{'" . $idx . "'}})";
    $Regexp::Common::lingua::pd{$idx} =
      $keep ? qr /($ch|($ch)($r)?\2)/ : qr  /$ch|($ch)($r)?\1/;

    #   print "[$ch]: ", $Regexp::Common::lingua::pd {$idx}, "\n";
    #   $Regexp::Common::lingua::pd {$idx};
  },
  ;

1;

__END__

=pod

=head1 NAME

Regexp::Common::lingua -- provide regexes for language related stuff.

=head1 SYNOPSIS

    use Regexp::Common qw /lingua/;

    while (<>) {
        /^$RE{lingua}{palindrome}$/    and  print "is a palindrome\n";
    }


=head1 DESCRIPTION

Please consult the manual of L<Regexp::Common> for a general description
of the works of this interface.

Do not use this module directly, but load it via I<Regexp::Common>.

=head2 C<$RE{lingua}{palindrome}>

Returns a pattern that recognizes a palindrome, a string that is the
same if you reverse it. By default, it only matches strings consisting
of letters, but this can be changed using the C<{-chars}> option.
This option takes a character class (default is C<[A-Za-z]>) as
argument.

If C<{-keep}> is used, only C<$1> will be set, and set to the entire
match.

This pattern requires at least perl 5.6.0.

=head1 SEE ALSO

L<Regexp::Common> for a general description of how to use this interface.

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

The original project [Regexp::Common](https://metacpan.org/pod/Regexp::Common)
is licensed through the MIT License, copyright (c) Damian Conway
(damian@cs.monash.edu.au) and Abigail (regexp-common@abigail.be).

=cut
