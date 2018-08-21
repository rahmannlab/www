---
title: Metatranscriptome Analysis
author: Genie
type: page
date: 2016-08-26T08:28:19+00:00

---
**Daniela Beisser, Sven Rahmann,
  
in collaboration with the [Biodiversity][1], Essen**

Next generation sequencing technologies are increasingly applied to analyse complex ecosystems by mRNA sequencing of whole communities. In principal, each sequenced mRNA allows an assignment of the underlying species as well as a functional annotation. While the functional information is sufficiently covered by databases such as Uniprot and NCBI the approach is currently limited by incomplete taxonomic references. 

[<img src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/tree2-300x274.png" alt="tree" width="300" height="274" class="alignright size-medium wp-image-1058" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/tree2-300x274.png 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/tree2-768x702.png 768w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/tree2-1024x936.png 1024w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/tree2-624x571.png 624w" sizes="(max-width: 300px) 100vw, 300px" />][2]

For an accurate assignment of taxonomic groups to environmental metatranscriptomic reads we build a custom database that comprises all major eukaryotic groups and a stand-alone tool to assign reads with a low false discovery rate.
  
The custom database includes peptide sequences translated from transcriptomes of all relevant eukaryotic taxonomic groups, in total 146 species. We do not attempt to assign sequence reads on species or genera level, but taxonomic groups. The biggest problem is the misassignment of sequences to incorrect species, we therefore perform rigorous filtering, in which we evaluate the distance between the best hit and next hit in another taxonomic group. The developed tool (TaxMapper, available at <a href="https://bitbucket.org/dbeisser/taxmapper" target="_blank">bitbucket</a> and <a href="http://bioconda.github.io/recipes/taxmapper/README" target="_blank">bioconda</a>) is build in a modular way to be applicable stepwise with user-set parameters or as a complete easy-to-use analysis with standard parameters starting from a RAPsearch mapping file to a visualization of community composition.
  
Additionally, we develop a reliable workflow for microeukaryotic metatranscriptome analysis. Written as a rule-based Snakemake workflow, it unites all major bioinformatic steps: preprocessing of raw reads, functional and taxonomic assignment with TaxMapper and statistical analyses. The set-up is very generic and can be adjusted to any environmental sample.

 [1]: https://www.uni-due.de/allgemeine_botanik/
 [2]: http://genomeinformatics.uni-due.de/wp-content/uploads/2016/08/tree2.png