#!/usr/bin/perl

use strict;
use warnings;
use LWP::Simple;

my $species = $ARGV[0];

die "must supply species name! - either fly or celegans as an argument"
  unless $species;

my $out_dir = '../GFF3';
if ( !-e $out_dir ) {
    print "Output directory ($out_dir) does not exist! Creating...\n";
    mkdir($out_dir)
      or die "Failed to create the output directory ($out_dir): $!\n";
    print "Done\n\n";
}

my $content;
my $out_file;
my $out;

if ( $species eq "celegans" ) {
    $out_file = 'Celegans.gff3';

    print "Retrieving GFF3 file from ensembl...\n";
    $content = get(
'ftp://ftp.ensembl.org/pub/release-89/gff3/caenorhabditis_elegans/Caenorhabditis_elegans.WBcel235.89.gff3.gz'
    );
}

elsif ( $species eq "fly" ) {
    $out_file = 'fly.gff3';

    print "Retrieving GFF3 file from ensembl...\n";
    $content = get(
'ftp://ftp.ensembl.org/pub/release-89/gff3/drosophila_melanogaster/Drosophila_melanogaster.BDGP6.89.gff3.gz'
    );
}

die "Failed to download gff3 file!" unless $content;
open( $out, '>', "$out_dir/$out_file" )
  or die "Can't create the gff3 file ($out_dir/$out_file): $!\n";

print $out "$content\n";

print "\n\nall done....\n\n";

close $out;
