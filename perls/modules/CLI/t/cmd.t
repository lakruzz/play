use strict;
use Test2::V0;
use File::Basename;
use lib dirname(__FILE__);


# Make sure we're testing the right (local) version.
use lib dirname(__FILE__).'/../../../modules';
use CLI::cmd;

#plan tests => 3; #TODO add plan!

subtest 'Wrong params' => sub{
  ok !eval{ cmd('1') },
    "cmd should fail if called without correct parameters (scalar)";
  ok !eval{ cmd(0) },
    "cmd should fail if called without correct parameters (integer)";
  ok !eval{ cmd( [1,"one"]) },
    "cmd should fail if called without correct parameters (Array)";
  ok !eval{cmd( blaha => 'echo cmd')},
    "cmd should fail if called without correct parameters (Hash ('command' is required))";
};

subtest 'Correct use - simple stuff' => sub {
  my $str = 'Hello world';
  my $got;

  ok $got = cmd( command => "echo $str"),
      "Successful execution of 'echo'";
  is $got, $str."\n",
    "Should print 'Hello world'";
};

subtest 'Using verbose' => sub {
  my $str = 'Hello world';
  my $stdout; capture_stdout(\$stdout);

  ok  cmd( command => "echo $str", verbose => 1),
    "Turn on verbose";

  chomp($stdout);

  is $stdout, "echo $str",
    "Verbose should print the command to execute";

  release_stdout();
};

subtest 'Defaults' => sub {
  my $out;
  capture_stdout(\$out);
  cmd( command => "echo Hello World", debug => 1);
  like $out, qr/verbose:0\n/,
    "verbose should be false";
  like $out, qr/errmsg:\n/,
    "errmsg should be undefined";
  like $out, qr/dryrun:0\n/,
    "dryrun should be false";
  like $out, qr/return_array:0\n/,
    "return_array should be false";
  like $out, qr/die_on_err:1\n/,
    "die_on_err should be true";
  like $out, qr/debug:1\n/,
    "debug is forced on (not default)";
  like $out, qr/merge_errout:1\n/,
    "merge_errout is true";





  release_stdout();
};

done_testing;

#-------------------------------------------------------------------#
#                          SUBFUNCTIONS
#-------------------------------------------------------------------#
sub capture_stdout{ # (\$scalar)
  my $output_ref = shift;
  open ALTSTDOUT, '>', $output_ref or die "Can't open ALTSTDOUT: $!"; # Die if the open doesn't succeed  - it's a prerequsite for the remainder of the test.
  select ALTSTDOUT;
}

sub release_stdout{
  select STDOUT;
}
