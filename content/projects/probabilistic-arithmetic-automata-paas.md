---
title: Probabilistic Arithmetic Automata (PAAs)
author: Genie
type: page
date: 2016-07-22T19:26:46+00:00

---
**Tobias Marschall & Sven Rahmann**

Probabilistic Arithmetic Automata are an extension of Deterministic Finite Automata (DFAs) and Hidden Markov Models (HMMs) to allow (arithmetic or arbitrary binary) operations. Exact state-value probability distributions can be efficiently computed with in this framework, and many applications in string algorithmics and computational biology can be modeled in this framework and treated in a unifying manner. We have done work on

  * Development of the PAA framework 
      * CPM&#8217;08 paper
  * Application: Exact analysis of pattern matching algorithms, e.g., Horspool, BNDM, BOM 
      * [LATA&#8217;10 paper][1]
      * [preprint of submitted journal version][2] (considerably extended)
      * [Software][3]
      * [More details on the analysis of pattern matching algorithms][4]
  * Application: significance of motifs (CPM&#8217;08) 
      * see DNA Motif Discovery
  * Application: seed sensitivity for seeded alignment (WABI&#8217;08)
  * Application: significance of peaks in mass spectra (RECOMB-Satellite conference on Proteomics and Systems Biology 2007; precedes the formal PAA definition)

 [1]: http://www.springerlink.com/content/g6xv2v740j61w462/fulltext.pdf
 [2]: http://arxiv.org/abs/1009.6114
 [3]: http://genomeinformatics.uni-due.de/software
 [4]: http://genomeinformatics.uni-due.de/research/analysis-of-pattern-matching-algorithms/