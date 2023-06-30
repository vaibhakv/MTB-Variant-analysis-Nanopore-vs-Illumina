Author: vaibhakv 
Date: June 2023
------
Aim:
* Long reads 
	+ Nanopore read alignment using Minimap2 
	+ Creating consensus sequences using Medaka
	+ Variant calling using Longshot


* Short reads
	+ Illumina short read alignment using bwa-mem2
	+ Variant calling using bcftools 


* Using different genome assemblies for carrying out the above methods and then comparing all the results.
-------
Data: 
* The long read and short read data was obtained from Sequence Read Archive (SRA) - 
	It was deposited by IRCCS San Raffaele Hospital, Segrate, Milan, Italy
	+ Single end `Long reads` - sample IT1745 from Italy: Veneto
	+ platform: `MinION` Mk1B platform with a `FLO-MIN106` `R9.4.1` flow cell and using Rapid Barcoding Kit (SQK-RBK004) 
	---
	+ Paired end `Short reads` - same sample IT1745 from Italy: Veneto
	+ platform: `MiniSeq` with paired-end Nextera XT library


