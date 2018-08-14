---
title: DNA Motif Discovery
author: Genie
type: page
date: 2016-01-07T11:23:02+00:00

---
**Tobias Marschall & Sven Rahmann**

[<img class="alignleft wp-image-189 size-medium" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/motif-300x100.png" alt="motif" width="300" height="100" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/motif-300x100.png 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/motif-768x256.png 768w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/motif-1024x341.png 1024w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/motif-624x208.png 624w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/motif.png 1133w" sizes="(max-width: 300px) 100vw, 300px" />][1]

The motif discovery problem consists of finding over-represented patterns in a collection of biosequences. It is one of the classical sequence analysis problems, but still has not been satisfactorily solved in an exact and efficient manner. This is partly due to the large number of possibilities of defining the motif search space and the notion of over-representation. Even for well-defined formalizations, the problem is frequently solved in an ad hoc manner with heuristics that do not guarantee to find the best motif.

We have developed a new class of efficient exact motif discovery methods, and also worked on modeling objective functions for evolutionary algorithms for motif discovery. [More details on motif discovery][2]. 

### Efficient exact Motif Discovery

<div>
  <a href="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/dist.png" rel="attachment wp-att-216"><img class="alignleft size-medium wp-image-216" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/dist-300x189.png" alt="dist" width="300" height="189" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/dist-300x189.png 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/dist.png 578w" sizes="(max-width: 300px) 100vw, 300px" /></a>
</div>

We show how to solve the motif discovery problem (almost) exactly on a practically relevant space of IUPAC generalized string patterns, using the p-value with respect to an i.i. d. model or a Markov model as the measure of over-representation. In particular, (i) we use a highly accurate compound Poisson approximation for the null distribution of the number of motif occurrences. We show how to compute the exact clump size distribution using a recently introduced device called probabilistic arithme tic automaton (PAA). (ii) We define two p-value scores for over-representation, the first one based on the total number of motif occurrences, the second one based on the number of sequences in a collection with at least one occurrence. (iii) We describe an algorithm to discover the optimal pattern with respect to either of the scores. The method exploits monotonicity properties of the compound Poisson approximation and is by orders of magnitude faster than exhaustive enumeration of IUPAC strings (11.8 h compared with an extrapolated running time of 4.8 years). (iv) We justify the use of the proposed scores for motif discovery by showing our method to outperform other motif discovery algorithms (e.g. MEME, Weeder) on benchmark datasets. We also propose new motifs on _Mycobacterium tuberculosis_.

<div>
  <ul>
    <li>
      Article in the ISMB&#8217;09 Bioinformatics special issue:[<a href="http://www.ncbi.nlm.nih.gov/pubmed/19478010" rel="nofollow">PubMed</a>] [<a href="http://bioinformatics.oxfordjournals.org/cgi/content/full/25/12/i356" rel="nofollow">Paper</a>]
    </li>
    <li>
      Slides of the talk at ISMB&#8217;09: [pdf]
    </li>
    <li>
      Software: The method has been implemented in Java and is part of the <a href="http://mosdi.googlecode.com/">MoSDi package</a>.
    </li>
  </ul>
</div>

<div>
</div>

### <a name="TOC-Modeling-Evolutionary-Fitness-for-DNA-Motif-Discovery"></a>Modeling Evolutionary Fitness for DNA Motif Discovery

<div>
  <img class="alignleft wp-image-215 size-full" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/ocm.png" alt="ocm" width="303" height="59" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/ocm.png 303w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/ocm-300x58.png 300w" sizes="(max-width: 303px) 100vw, 303px" />
</div>

Many heuristic methods, including evolutionary algorithms, have been developed for the motif discovery problem. However, comparatively little attention has been devoted to the adequate evaluation of motif quality, especially when comparing motifs of different lengths. We propose an evolution strategy to solve the motif discovery problem based on a new fitness function that simultaneously takes into account (1) the number of motif occurrences, (2) the motif length, and (3) its information content. Experimental results show that the proposed method succeeds in uncovering the correct motif positions and length with high accuracy.

  * Article in the GECCO&#8217;09 proceedings: \[Paper\] (**Best paper award** in the Computational Biology and Bioinformatics track)
  * Slides of the talk at GECCO&#8217;09: [pdf]
  * Software: A Java implementation is available here.

 [1]: http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/motif.png
 [2]: http://genomeinformatics.uni-due.de/research/motif-discovery