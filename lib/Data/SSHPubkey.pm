# -*- Perl -*-
#
# utility function to parse SSH public keys with
#
# run perldoc(1) on this file for documentation

package Data::SSHPubkey;

use 5.010;
use strict;
use warnings;

use Carp qw(croak);

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(&pubkeys);

our $VERSION = '0.01';

sub pubkeys {
    my ($input) = @_;
    my $fh;
    open $fh, '<', $input or croak "could not open $input: $!";
    my @keys;
    while ( my $line = readline $fh ) {
; # TODO
    }
    return \@keys;
}

1;
__END__

=head1 NAME

Data::SSHPubkey - utility function to parse SSH public keys with

=head1 SYNOPSIS

  use Data::SSHPubkey;

  my $keylist = Data::SSHPubkey::pubkeys( $file_or_scalarref );
  ...

=head1 DESCRIPTION

C<Data::SSHPubkey> parses SSH public keys, or at least those supported
by C<ssh-keygen(1)>. It may be prudent to check any uploaded data with
C<ssh-keygen> though this module should help extract that from web form
upload data or the like to get to that step.

=head1 FUNCTIONS

=over 4

=item B<pubkeys> I<filename-or-scalarref>

A filename (scalar) will be opened and the public keys therein parsed;
a scalar reference will be treated as an in-memory file and will
likewise be parsed.

TODO return format

=back

=head1 BUGS

Please report any bugs or feature requests to C<bug-data-sshpubkey at
rt.cpan.org>, or through the web interface at
L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data-SSHPubkey>. I
will be notified, and then you'll automatically be notified of progress
on your bug as I make changes.

Patches might best be applied towards:

L<https://github.com/thrig/Data-SSHPubkey>

=head1 SEE ALSO

L<Config::OpenSSH::Authkey> - older module more aimed at management of
C<~/.ssh/authorized_keys> data and not specifically public keys.

=head1 AUTHOR

thrig - Jeremy Mates (cpan:JMATES) C<< <jmates at cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2019 by Jeremy Mates

This program is distributed under the (Revised) BSD License:
L<http://www.opensource.org/licenses/BSD-3-Clause>

=cut
