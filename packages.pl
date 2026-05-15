#!/usr/bin/env perl
use strict;
use warnings;

my $packages_csv = 'packages.csv';
my $makefile = 'Makefile';

sub get_software {
  open my $fh, '<', $packages_csv or die "Couldn't open '$packages_csv': $!";

  my @envs = (split /\,/, <$fh> =~ s/\R\z//r)[1..4];

  my %software;

  while(<$fh>) {
    chomp;
    my @pkgs = split /\,/;
    my $name = shift @pkgs;
    my %pkgs;
    @pkgs{@envs} = @pkgs;
    $software{$name} = \%pkgs;
  }

  close $fh;

  return \@envs, \%software;
}

sub packages_for_envs {
  my $envs_ref = shift;
  my $software_ref = shift;
  my @pkg_block;
  
  foreach my $env (@{$envs_ref}) {
    next if ($env eq 'NPM');

    my (@env_bin_pkgs, @env_npm_pkgs);

    foreach my $name (sort keys %{$software_ref}) {
      my $bin_pkg = $software_ref->{$name}{$env};
      my $npm_pkg = $software_ref->{$name}{'NPM'};

      if ($bin_pkg ne '?' and $bin_pkg !~ /^-/) {
        push @env_bin_pkgs, $bin_pkg;
      } elsif ($npm_pkg ne '?' and $npm_pkg !~ /^-/) {
        push @env_npm_pkgs, $npm_pkg;
      }
    }

    push @pkg_block, uc($env) . "_BIN_PKGS := @env_bin_pkgs";
    push @pkg_block, uc($env) . "_NPM_PKGS := @env_npm_pkgs";
    push @pkg_block, ""
  }

  return join "\n", @pkg_block
}

sub update_makefile {
  my $marker_start = "# PACKAGES_BLOCK_START\n";
  my $marker_end = "# PACKAGES_BLOCK_END";
  my $pkg_block = shift;

  my $content = do {
    open my $fh, '<', $makefile or die "Couldn't open '$makefile': $!";
    local $/;
    <$fh>
  };

  my $updated = $content;
  $content =~ s/(?<=$marker_start).*(?=$marker_end)/$pkg_block/s;

  if ($updated ne $content) {
    open my $fh, '>', $makefile or die "Could not open file '$makefile': $!";
    print $fh $content;
    close $fh;
    print "Wrote updated $makefile.\n"
  } else {
    print "Nothing changed.\n"
  }
}

sub main {
  if ((stat($packages_csv))[9] <= (stat($makefile))[9]) {
    print "$packages_csv is not newer than $makefile.\n"
  } else {
    my ($envs_ref, $software_ref) = get_software();
    my $pkg_block;
    $pkg_block .= packages_for_envs $envs_ref, $software_ref;
    update_makefile $pkg_block
  }
}

main()
