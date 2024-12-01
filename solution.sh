#!/bin/bash

cat input.txt | awk '{print $1}' | sort -n --qsort > tmp1.txt
cat input.txt | awk '{print $2}' | sort -n --qsort > tmp2.txt
awk 'FNR == NR {a[NR]=$1} FNR != NR {print a[FNR] OFS $1}' tmp1.txt tmp2.txt \
  | awk '{if($1<=$2){sum+=($2-$1)}else{sum+=($1-$2)}} END{print sum}'
awk 'FNR == NR {a[$1]=0} FNR != NR && $1 in a {a[$1]++} END{for(v in a){sum+=(v*a[v])};print sum}' tmp1.txt tmp2.txt
rm tmp1.txt tmp2.txt
