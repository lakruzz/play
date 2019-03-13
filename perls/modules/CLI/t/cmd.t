use strict;
use Test2::V0;
use File::Basename;
use lib dirname(__FILE__);
use TestCLI;

plan tests => 3;


our %Options;
ok(1, "1 is true, \”thou thall pass\"");
ok(2, "2 is true, \”thou thall pass\"");
ok(3, "3 is true, \”thou thall pass\"");

done_testing;
