#!/usr/bin/perl

use strict;

my $nb_file_found = 0;
open(LS,"ls *Nfowleri.snp |");
while(<LS>){
        $nb_file_found++;
}
close(LS);
if ($nb_file_found < 1){
        print "No file found with extension \".Nfowleri.snp\". This script allows to merge multiple SNP files (named as follows \"strainname.Nfowleri.snp\") obtained with VarScan into a global VCF file.\n";
        exit;
}


print "##fileformat=VCFv4.1\n";
print "#CHROM   POS     ID      REF     ALT     QUAL    FILTER  INFO    FORMAT  ";

my %corr;
open(F,"/media/results_datacalcul/Alexis/Naegleria/raw/SRR.info.xls");
while(<F>){
        my $line = $_;
        $line =~s/\n//g;$line =~s/\r//g;
        my ($srr,$name) = split(/\t/,$line);
        #$corr{$srr} = $name;
}
close(F);
