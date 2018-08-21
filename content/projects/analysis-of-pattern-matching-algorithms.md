---
title: Analysis of Pattern Matching Algorithms
author: Genie
type: page
date: 2016-01-07T10:52:29+00:00

---
We propose a framework for the exact probabilistic analysis of window-based pattern matching algorithms, such as Boyer-Moore, Horspool, Backward DAWG Matching, Backward Oracle Matching, and more.
  
In particular, we show how to efficiently obtain the distribution of such an algorithm&#8217;s running time cost for any given pattern in a random text model, which can be quite general, from simple uniform models to higher-order Markov models or hidden Markov models (HMMs).
  
Furthermore, we provide a technique to compute the exact distribution of differences in running time cost of two algorithms.
  
In contrast to previous work, our approach is neither limited to simple text models, nor to asymptotic statements, nor to moment computations such as expectation and variance.

Methodically, we use extensions of finite automata which we call deterministic arithmetic automata (DAAs) and probabilistic arithmetic automata (PAAs).
  
To our knowledge, this is the first time that substring- or suffix-based pattern matching algorithms are analyzed exactly.

Experimentally, we compare Horspool&#8217;s algorithm, Backward DAWG Matching, and Backward Oracle Matching on prototypical patterns of short length and provide statistics on the size of minimal DAAs for these computations.

More details can be found in [this preprint][1]. The computations can be reproduced with our [MoSDi software][2] as follows:

Figure 1:
  
`java -jar mosdi-1.1.jar cost-distribution (horspool|bom|bndm) (ATATAT|ACGTAC) (100|500)`

Figure 2:
  
`java -jar mosdi-1.1.jar cost-distribution horspool,bom (ACGTAC|ATATAT|CGAAAA|CAAAAA) 100<br />
java -jar mosdi-1.1.jar cost-distribution horspool,bndm (ACGTAC|ATATAT|CGAAAA|CAAAAA) 100<br />
java -jar mosdi-1.1.jar cost-distribution bndm,bom (ACGTAC|ATATAT|CGAAAA|CAAAAA) 100`

Table 1 and Figure 3:
  
`java -jar mosdi-1.1.jar automata-sizes (horspool|bom|bndm) (2|3|4|5|6|7)`

If you have installed MoSDi on a UNIX system, you can (for convenience) replace
  
`"java -jar mosdi-1.1.jar" by "mosdi-pm-analysis"`

 [1]: http://arxiv.org/abs/1009.6114
 [2]: http://mosdi.googlecode.com