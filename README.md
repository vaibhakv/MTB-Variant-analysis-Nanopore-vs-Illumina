Author: vaibhakv 
-----
Date: June 2023
------
Aim:
* Long reads 
	+ Nanopore read alignment using `minimap2` 
	+ Creating consensus sequences using`medaka`
	+ Variant calling using `longshot`


* Short reads
	+ Illumina short read alignment using `bwa-mem2`
	+ Variant calling using `bcftools` 


* Using different genome assemblies for carrying out the above methods and then comparing all the results.
-------
Data: 
* The long read and short read data was obtained from Sequence Read Archive (SRA) - 
	It was deposited by IRCCS San Raffaele Hospital, Segrate, Milan, Italy
	+ Single end **Long reads** - sample IT1745 from Italy: Veneto
	+ platform: **MinION** Mk1B platform with a **FLO-MIN106** **R9.4.1** flow cell and using Rapid Barcoding Kit (SQK-RBK004) 
	---
	+ Paired end **Short reads** - same sample IT1745 from Italy: Veneto
	+ platform: **MiniSeq** with paired-end Nextera XT library
-------
Visualization:

* Comparison between the alignment and variants of nanopore and illumina was done in IGV.
As you can see, we got significantly more variants from nanopore data than from illumina. But that doesn't mean they're all accurate. I'll add the detailed conclusiom of this analysis later.

Btw this alignment was done using the reference genome assembly version CDC1551 which was available in IGV by default. The later ones we'll have to upload the reference.

![Alt text](https://github.com/vaibhakv/MTB-Variant-analysis-Nanopore-vs-Illumina/blob/master/screenshots/Screenshot%20from%202023-06-30%2021-49-55.png)

After hiding indels of size `>5`

![Alt text](https://github.com/vaibhakv/MTB-Variant-analysis-Nanopore-vs-Illumina/blob/master/screenshots/Screenshot%20from%202023-06-30%2021-38-22.png)
