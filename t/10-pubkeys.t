#!perl
use 5.010;
use strict;
use warnings;
use File::Spec ();
use Test::More;    # plan is down at bottom

use Data::SSHPubkey;

can_ok( 'Data::SSHPubkey', qw(pubkeys) );

# these are from ssh-keygen -t option types, and the rsa thereof also
# converted into the three support -m option types listed by SSH as
# shipped with OpenBSD 6.4. not supported are SSH2 DSA keys nor the much
# older SSH1 protocol keys
my @keyfiles =
  (qw(PEM.pub PKCS8.pub RFC4716.pub ecdsa.pub ed25519.pub rsa.pub));

for my $f (@keyfiles) {
    ( my $type = $f ) =~ s/\.pub//;
    my $ret = Data::SSHPubkey::pubkeys( File::Spec->catfile( 't', $f ) );
    use Data::Dumper;
    diag Dumper $ret;
    ok( defined $ret, "keyfile $f" );
}

plan tests => 1 + scalar @keyfiles
