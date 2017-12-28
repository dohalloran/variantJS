#!/usr/bin/perl

use strict;
use warnings;

my $species = $ARGV[0];

die "must supply species name! i.e. fly or celegans" unless $species;

my $out_dir = '../Parsed_GFF3';
if ( !-e $out_dir ) {
    print "Output directory ($out_dir) does not exist! Creating...\n";
    mkdir($out_dir)
      or die "Failed to create the output directory ($out_dir): $!\n";
    print "Done\n\n";
}

my %seen;
my $input;
my $in_dir      = '../GFF3';
my $outputfile1 = 'csome1.txt';
my $outputfile2 = 'csome2.txt';
my $outputfile3 = 'csome3.txt';
my $outputfile4 = 'csome4.txt';
my $outputfile5 = 'csome5.txt';
my $outputfile6 = 'csome6.txt';

open my $out1, '>>', "$out_dir/$outputfile1"
  or die "Can't open $out_dir/$outputfile1, Perl says $!\n";
open my $out2, '>>', "$out_dir/$outputfile2"
  or die "Can't open $out_dir/$outputfile2, Perl says $!\n";
open my $out3, '>>', "$out_dir/$outputfile3"
  or die "Can't open $out_dir/$outputfile3, Perl says $!\n";
open my $out4, '>>', "$out_dir/$outputfile4"
  or die "Can't open $out_dir/$outputfile4, Perl says $!\n";
open my $out5, '>>', "$out_dir/$outputfile5"
  or die "Can't open $out_dir/$outputfile5, Perl says $!\n";
open my $out6, '>>', "$out_dir/$outputfile6"
  or die "Can't open $out_dir/$outputfile6, Perl says $!\n";

if ( $species eq "celegans" ) {

    $input = 'Celegans.gff3';

    open my $in, '<', "$in_dir/$input"
      or die "Can't open $in_dir/$input, Perl says $!\n";

    print "Parsing GFF3 file...\n";

    while ( my $line = <$in> ) {

        if (
            (
                $line =~
m/^I\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=([a-zA-Z0-9]+)\..*;biotype=protein_coding;.*\n/i
            )
            && ( !$seen{$3} )
          )
        {
            $seen{$3} .= $3;
            print $out1 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';

        }
        elsif (
            (
                $line =~
m/^II\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=([a-zA-Z0-9]+)\..*;biotype=protein_coding;.*\n/i
            )
            && ( !$seen{$3} )
          )
        {
            $seen{$3} .= $3;
            print $out2 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';

        }
        elsif (
            (
                $line =~
m/^III\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=([a-zA-Z0-9]+)\..*;biotype=protein_coding;.*\n/i
            )
            && ( !$seen{$3} )
          )
        {
            $seen{$3} .= $3;
            print $out3 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';
        }
        elsif (
            (
                $line =~
m/^IV\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=([a-zA-Z0-9]+)\..*;biotype=protein_coding;.*\n/i
            )
            && ( !$seen{$3} )
          )
        {
            $seen{$3} .= $3;
            print $out4 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';
        }
        elsif (
            (
                $line =~
m/^V\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=([a-zA-Z0-9]+)\..*;biotype=protein_coding;.*\n/i
            )
            && ( !$seen{$3} )
          )
        {
            $seen{$3} .= $3;
            print $out5 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';
        }
        if (
            (
                $line =~
m/^X\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=([a-zA-Z0-9]+)\..*;biotype=protein_coding;.*\n/i
            )
            && ( !$seen{$3} )
          )
        {
            $seen{$3} .= $3;
            print $out6 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';
        }

    }

    print "\n\nall done....\n\n";
    close $in;
}

elsif ( $species eq "fly" ) {

    $input = 'fly.gff3';
    open my $in, '<', "$in_dir/$input"
      or die "Can't open $in_dir/$input, Perl says $!\n";

    print "Parsing GFF3 file...\n";

    while ( my $line = <$in> ) {

        if ( $line =~
m/^2L\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=(.*);biotype=protein_coding;.*\n/i
          )
        {

            print $out1 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';

        }
        elsif ( $line =~
m/^2R\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=(.*);biotype=protein_coding;.*\n/i
          )
        {

            print $out2 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';

        }
        elsif ( $line =~
m/^3L\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=(.*);biotype=protein_coding;.*\n/i
          )
        {

            print $out3 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';
        }
        elsif ( $line =~
m/^3R\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=(.*);biotype=protein_coding;.*\n/i
          )
        {

            print $out4 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';
        }
        elsif ( $line =~
m/^4\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=(.*);biotype=protein_coding;.*\n/i
          )
        {

            print $out5 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';
        }
        elsif ( $line =~
m/^X\t.*\t.*\t(.*)\t(.*)\t.*\t.*\t.*\t.*Name=(.*);biotype=protein_coding;.*\n/i
          )
        {

            print $out6 '{"x":'
              . $1 . ',"y":'
              . $2
              . ',"description":"'
              . $3 . '"},';
        }
    }
    print "\n\nall done....\n\n";
    close $in;
}

close $out1;
close $out2;
close $out3;
close $out4;
close $out5;
close $out6;
