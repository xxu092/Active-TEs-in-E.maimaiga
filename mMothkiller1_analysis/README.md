# To get insertion locations for full-length mMothkiller1 family, TE_00001679 is the same family as mMothkiller1
```
grep "TE_00001679" Entomophaga_maimaiga_var_ARSEF_7190.fasta.out > Emai1679TEtrimmer.rmout
RM2Bed.py RM1679full.rm.out
#sort the gff3 file to do intersect
bedtools sort -i RM1679full.rm.gff3 > RM1679full.sorted.rm.gff3 
```
To check how many insertions overlap the genes
```
bedtools intersect -a RM1679full.sorted.rm.gff3 -b Entmai1_GeneCatalog_20210808.genes2.sorted.gff3 -wo > RM1679fullOverlapgenes.bed
#20
bedtools intersect -a RM1679full.sorted.rm.gff3 -b Entmai1_GeneCatalog_20210808.UTRCDS1.gff3 -wo > RM1679fullOverlapCDS.bed
```

16 5' UTR 
1 3'UTR
3 CDS
get the distance between TE and nearest genes
```
bedtools closest -a RM1679full.sorted.rm.gff3 -b Entmai1_GeneCatalog_20210808.genes2.sorted.gff3 > RM1679fullgenes.bed
```
# To get tsds and TIRs of full-length elements
get location of full length element and TSD locations using `getfulllengthlocation.R` script
and get fasta from the location table 
and do muscle to do alignment
```
module load muscle

muscle -align fam1679full.fasta -output fam1679full.fasaln.fasta -html fam1679full.aln.html
muscle -align fam1679fullTSD.fasta -output fam1679fullTSD.fasaln.fasta 
```
And draw sequence logo from weblogo using these alignments. 
