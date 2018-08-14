---
title: Exome Analysis
author: Genie
type: page
date: 2016-08-19T13:09:09+00:00

---
Exomate is an exome-sequencing pipeline with a web frontend. It automates most steps needed to go from FASTQ files to variant calls, puts the calls and metadata about patients, samples, etc. into a database and then allows interactive analysis via a web frontend. It is primarily designed for easy use and has already been used in various studies [1,2,3].[<img class="wp-image-1041 alignleft" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/results-1024x504.png" alt="results" width="331" height="163" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/results-1024x504.png 1024w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/results-300x148.png 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/results-768x378.png 768w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/results-624x307.png 624w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/results.png 1431w" sizes="(max-width: 331px) 100vw, 331px" />][1][<img class="wp-image-1040 alignleft" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/overlap.png" alt="overlap" width="196" height="165" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/overlap.png 568w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/overlap-300x253.png 300w" sizes="(max-width: 196px) 100vw, 196px" />][2]

&nbsp;

&nbsp;

&nbsp;

&nbsp;

A central postgresql database stores all information and statistics. An integrated
  
webserver or an external apache server can both be used to generate the graphical interface.

The Exome Analysis GraphicaL Environment (EAGLE) further improves the concept of Exomate and combines a best practices variant calling workflow, with a web frontend. By storing the called information in specifically structured and encapsulated hdf5 files, (instead of a huge postgresql database) EAGLE allows filtering and parameter tuning in almost real time. This enables iterative tuning of thresholds, or the selection of different samples for filtering by non computer scientists via the web interface.

The aim of EAGLE is to identify disease causing SNPs, copy number variations and structural variants by using exome sequencing data of tumor and blood or triples (index, father, mother), filter the data by official databases such as dbsnp and inhouse filter samples and show statistics to the end user.

[1] Martin, M. et al., 2013. Exome sequencing identifies recurrent somatic mutations in EIF1AX and SF3B1 in uveal melanoma with disomy 3. Nat. Genet. 45, 933–936.
  
[2] Czeschik, J.C. et al., 2013. Clinical and mutation data in 12 patients with the clinical diagnosis of Nager syndrome. Hum. Genet. 132, 885–898.
  
[3] Voigt, C., et al., 2013. Oto-facial syndrome and esophageal atresia, intellectual disability and zygomatic anomalies &#8211; expanding the phenotypes associated with EFTUD2 hfg mutations.
  
Orphanet J Rare Dis 8, 110.

 [1]: http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/results.png
 [2]: http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/overlap.png