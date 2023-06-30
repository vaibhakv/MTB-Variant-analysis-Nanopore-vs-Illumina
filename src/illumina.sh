#!/bin/bash

# author: vaibhakv
# usage:
# ./src/illumina.sh <reference genome along with path just dont include ".fa" extension> <sample name> <sample directory> <output directory>
# for eg....     ./src/illumina.sh ref/H37Rv/h37rv SRR23086708 raw_data/ exp5/ 
# make sure you're in the right conda environment 

reference=$1
sample=$2
sampledir=$3
outdir=$4

bwa-mem2-2.2.1_x64-linux/bwa-mem2 index ${reference}.fa
bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 4 ${reference}.fa ${sampledir}${sample}_1.fastq ${sampledir}${sample}_2.fastq > ${outdir}${sample}.sam
samtools sort ${outdir}${sample}.sam -o ${outdir}${sample}.sorted.sam

samtools view -bS ${outdir}${sample}.sorted.sam > ${outdir}${sample}.sorted.bam

samtools faidx ${reference}

samtools index ${outdir}${sample}.sorted.bam
bcftools mpileup -Ou -f ${reference}.fa -o ${outdir}${sample}.pileup.bcf ${outdir}${sample}.sorted.bam
### -Ou --> Output format: uncompressed bcf
### -Ov --> Output format: uncompressed vcf
bcftools call -m -v -Ou --ploidy 1 -o ${outdir}${sample}.call.bcf ${outdir}${sample}.pileup.bcf 
### -m --> default calling (not consensus calling)
### -v --> output only variants
bcftools norm -Ou -f ${reference}.fa -d all -o ${outdir}${sample}.norm.bcf ${outdir}${sample}.call.bcf 
### -d --> which positions to consider.. all
bcftools filter -Ov -e 'QUAL<40 || DP<10 || GT!="1/1"' -o ${outdir}${sample}_bcftools.vcf ${outdir}${sample}.norm.bcf
### -e --> exclude these quality measures
### -i --> include these quality measures
### Quality measures --> QUAL - Phred quality
###                      DP - Depth
###                      GT - cause, haploid