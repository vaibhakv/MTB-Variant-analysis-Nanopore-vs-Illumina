#!/bin/bash

#author: vaibhakv
#usage: 
#Run this command from the main directory
# ./src/nanopore.sh <reference genome along with path just dont include ".fa" extension> <sample name> <sample directory> <output directory>
# for eg....     ./src/nanopore.sh ref/H37Rv/h37rv SRR23086719 raw_data/ exp3 



reference=$1
sample=$2
sampledir=$3
outdir=$4

minimap2 -d ${reference}_index.mmi ${reference}.fa

minimap2 -ax map-ont -t 4 ${reference}_index.mmi ${sampledir}${sample}.fastq > ${outdir}${sample}.sam

#medaka_consensus -i ${sampledir}${sample}.fastq -d ${reference}.fa -o medaka/ -t 4 -m r941_min_sup_g507

samtools sort ${outdir}${sample}.sam -o ${outdir}${sample}.sorted.sam

samtools view -bS ${outdir}${sample}.sorted.sam > ${outdir}${sample}.sorted.bam

samtools faidx ${reference}

samtools index ${outdir}${sample}.sorted.bam 

longshot --bam ${outdir}${sample}.sorted.bam --ref ${reference}.fa --out ${outdir}${sample}_longshot.vcf
