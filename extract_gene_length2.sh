#!/bin/bash

gene_id=$1
gff3=$2
type=$3


while read gene
do
        echo -en "$gene\t"
        grep -P "ID=$gene" $gff3 | awk -v type=$type '{print $5-$4+1"\t"type}'
done < $gene_id
