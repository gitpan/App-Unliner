use strict;

use Test::More;

use Config;
my $perlpath = $Config{perlpath};


if (-x '/bin/sh') {
  plan tests => 1;
} else {
  plan skip_all => '/bin/sh not available';
  exit;
}

like(`$perlpath -I lib bin/unliner t/programs/exec.unliner "some arg"`,
     qr{^Hello from /\S+ some arg \d+$});
