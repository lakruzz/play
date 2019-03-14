#!/usr/bin/perl
require 5.14.0;
use strict;                # http://perldoc.perl.org/strict.html
our %Options = (
  run_tests      => 1,
  check_for_root => 1
);

$Options{check_for_root} && check_for_root();
system('echo "yes" \| cpan'); # cpan asks for a config on it's irst run, answer 'yes' to go with the defaults
install('lib');
install('YAML');
install('Test2:V0');
install('Test2:Harness');

# system('cpan local:lib');
# system('cpan App:cpanminus');



sub install{
  my $package = shift;
  system("cpan -T $package"); ##
  $Options{run_tests}  && system('cpan -t $package'); ##
}

sub check_for_root{
  our $acl = `id -u`;
  chomp($acl);
  if ($acl ne '0'){
    print "Snap! Oh auch!!!\nThis script uses cpan.pm, it must run as root - use 'sudo'\n";
    exit 1;
  }
}
