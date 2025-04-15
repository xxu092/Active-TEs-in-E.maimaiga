
full<-fam1679 %>% filter(pident >=97.0) %>% filter(qstart == 1) %>% filter(qend ==120)
plus<-full %>% filter(send > sstart)
plus
plusloc<-plus %>% select(c("sseqid","sstart","send"))
write_tsv(plusloc,"~/bigdata/activefam/Emai1679_2024/1679plusloc.tsv",col_names = F)

minus <- full %>% filter (send < sstart)
minus 
minusloc<-minus %>% select(c("sseqid","send","sstart"))
write_tsv(minusloc,"~/bigdata/activefam/Emai1679_2024/1679minusloc.tsv",col_names = F)




plusloc <- plusloc %>% mutate(tsdstart = sstart - 8) %>% mutate(tsdend = send + 8)
plusloc
plustsd <- plusloc %>% select(c("sseqid","tsdstart","tsdend")) 
write_tsv(plustsd,"~/bigdata/activefam/Emai1679_2024/plustsd.tsv",col_names = F)


minusloc <- minusloc %>% mutate(tsdstart = send - 8) %>% mutate(tsdend = sstart + 8)
minusloc
minustsd <- minusloc %>% select(c("sseqid","tsdstart","tsdend")) 
write_tsv(minustsd,"~/bigdata/activefam/Emai1679_2024/minustsd.tsv",col_names = F)
