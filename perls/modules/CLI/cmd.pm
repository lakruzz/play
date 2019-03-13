package CLI::cmd;

require 5.14.0;
use strict;                # http://perldoc.perl.org/strict.html
use Carp;                  # http://perldoc.perl.org/Carp.html

sub cmd ($) {
  # Safe execution of shell commands
  # Input is a hash containing the options and parameters to execute:
  #
  # command      [requied]      The command to execute
  # die_on_err   [optional=1]   When set to true, the program will terminate,
  #                             using croak, if the command execution returns
  #                             a non-zero value.
  # verbose      [optional=0]   When true, the command will be typed to STDOUT
  #                             just prior to execution.
  # return_array [optional=0]   When true result returns an array, false returns
  #                             scalar.
  # merge_errout [optional=1]   True merges ERROUT into STDOUT, false returns only
  #                             STDOUT, ERROUT is unhandled (still prints)
  #
  # The example below executes 'git push' in verbose mode, and continues even if
  # it fails - The return code is (as always) available from $?
  #
  #my $res =	cmd(
  #		command => 'git push',
  #		verbose => $Options{verbose},
  #   die_on_error => 0 );

  my %opt = @_;
  croak "input parameter for key 'command' required" unless ( $opt{command} );

  # Deal with defaults if unset
	defined( $opt{command} )      ||  do { croak "input parameter for key 'command' required" };
  defined( $opt{die_on_err} )   ||  do {$opt{die_on_err}   = 1};
	defined( $opt{merge_errout} ) ||  do {$opt{merge_errout} = 1};
	defined( $opt{verbose} )      ||  do {$opt{verbose}      = 0};
  defined( $opt{dryrun} )       ||  do {$opt{dryrun}       = 0};
	defined( $opt{return_array} ) ||  do {$opt{return_array} = 0};
  defined( $opt{errmsg} )       ||  do {$opt{errmsg}   = undef};
  defined( $opt{debug})         ||  do {$opt{debug}        = 0};

  if ($opt{dryrun} ){ $opt{verbose} = 1};

  $opt{debug} && do { foreach my $key (keys(%opt)){ print "  $key:$opt{$key}\n"} };

  # merge_errout
	my $cmd = ( $opt{merge_output} )? $opt{command} . ' 2>&1' : $opt{command};

  # verbose
  my @res;
  $opt{dryrun} && print "Running DRY:  ";
	$opt{verbose} && print $opt{command}."\n";
  $opt{dryrun} || do {@res = qx($cmd)};

  # die_on_err
  if ( $opt{die_on_err} ) {
      if ($?) {
          my $msg = defined($opt{errmsg})?
            $opt{errmsg} :
            "Execution of [$cmd] returned a non-zero value (".( ($?) / 256 ).")";
          croak $msg ;
          print $msg ;
          die;
      }
  };

	# return_array
  return ( $opt{return_array} ) ? @res : join( '', @res );

}

1;
