---
title: Analysis of ddRAD-seq data with error tolerant hashing
author: Genie
type: page
date: 2016-07-18T16:03:15+00:00

---
**Henning Timm, Sven Rahmann,
  
in collaboration with [AG Aquatische Ökosystemforschung][1], Essen**

### What is ddRAD-seq?

### [<img class="wp-image-914 size-medium alignright" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-281x300.png" alt="RADOverview" width="281" height="300" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-281x300.png 281w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-768x820.png 768w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-960x1024.png 960w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-624x666.png 624w" sizes="(max-width: 281px) 100vw, 281px" />][2]

Double digest sequencing of restriction site associated DNA (ddRAD-seq) is used in population genomics in order to reduce the complexity of genomic data for inter- and intra-population analysis. The genetic diversity, meaning the abundance of different mutations in a population, can give insight into the quality of the habitat.

For example, if the diversity of two populations  differs, this might be a sign for a stressor affecting one of the populations. A population under stress is expected to show less diversity, as only the best fitted individuals can survive under bad conditions.

### How is ddRAD-seq data generated?

The ddRAD-seq protocol uses restriction enzymes to digest the DNA sequences of the target genome. From the resulting fragments those with right size and structure are sequenced. Due to this, all reads in a ddRAD-seq data set originate from distinct loci in the genome, namely the restriction sites at which the enzymes cut the DNA strand.

### Challenges

As for most species no high quality reference genome, if any at all, is available. Because of that, the analysis of ddRAD-seq data (RAD data for short) has to work without a reference. The main problem to be solved is the re-association of reads with their originating loci, where both mutations and sequencing errors have to be taken into account. As the data sets can be huge, the efficient clustering of similar sequences, preferably with linear run time, is needed, before any other analysis can begin. This problem can be solved with the help of error tolerant hashing, both precisely and efficiently.

As the analysis of RAD data is highly dependent on the structure enforced by the ddRAD-seq protocol, verifying the results of an analysis can be difficult. Due to this a well documented ground truth is needed, which has to model the structure as well as biological and technical patterns expected in RAD data.

### Publications

  * Poster &#8220;Clustering of ddRAD-seq reads with randomized hash functions for biodiversity analysis&#8221; at _iSEQ Symposium on Methods and Applications of Next Generation Sequencing in Evolutionary Research,_ 2014, hosted by [**Henning Timm, Sven Rahmann,
  
in collaboration with [AG Aquatische Ökosystemforschung][1], Essen**

### What is ddRAD-seq?

### [<img class="wp-image-914 size-medium alignright" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-281x300.png" alt="RADOverview" width="281" height="300" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-281x300.png 281w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-768x820.png 768w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-960x1024.png 960w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview-624x666.png 624w" sizes="(max-width: 281px) 100vw, 281px" />][2]

Double digest sequencing of restriction site associated DNA (ddRAD-seq) is used in population genomics in order to reduce the complexity of genomic data for inter- and intra-population analysis. The genetic diversity, meaning the abundance of different mutations in a population, can give insight into the quality of the habitat.

For example, if the diversity of two populations  differs, this might be a sign for a stressor affecting one of the populations. A population under stress is expected to show less diversity, as only the best fitted individuals can survive under bad conditions.

### How is ddRAD-seq data generated?

The ddRAD-seq protocol uses restriction enzymes to digest the DNA sequences of the target genome. From the resulting fragments those with right size and structure are sequenced. Due to this, all reads in a ddRAD-seq data set originate from distinct loci in the genome, namely the restriction sites at which the enzymes cut the DNA strand.

### Challenges

As for most species no high quality reference genome, if any at all, is available. Because of that, the analysis of ddRAD-seq data (RAD data for short) has to work without a reference. The main problem to be solved is the re-association of reads with their originating loci, where both mutations and sequencing errors have to be taken into account. As the data sets can be huge, the efficient clustering of similar sequences, preferably with linear run time, is needed, before any other analysis can begin. This problem can be solved with the help of error tolerant hashing, both precisely and efficiently.

As the analysis of RAD data is highly dependent on the structure enforced by the ddRAD-seq protocol, verifying the results of an analysis can be difficult. Due to this a well documented ground truth is needed, which has to model the structure as well as biological and technical patterns expected in RAD data.

### Publications

  * Poster &#8220;Clustering of ddRAD-seq reads with randomized hash functions for biodiversity analysis&#8221; at _iSEQ Symposium on Methods and Applications of Next Generation Sequencing in Evolutionary Research,_ 2014, hosted by][3] at the [Max Planck Institute for Evolutionary Anthropology][4] in Leipzig.
  * Poster &#8220;Estimation of genetic diversity with RAD sequencing and mutation-tolerant hashing&#8221; at _14. Tag der Forschung der Medizinischen Fakultät der Universität Duisburg-Essen_, 2015.

 [1]: https://www.uni-due.de/leeselab/leeselab
 [2]: http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/RADOverview.png
 [3]: https://www.idiv.de/
 [4]: http://www.eva.mpg.de/german/index.html