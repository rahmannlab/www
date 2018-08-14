---
title: q-unique sequences
author: Genie
type: page
date: 2016-07-22T18:54:21+00:00

---
**Marianna D&#8217;Addario & Sven Rahmann**

#### Design of q-unique DNA sequences

DNA nanoarchitechtures require carefully designed oligonucleotides with certain non-hybridization guarantees, which can be formalized as the q-uniqueness property on the sequence level. The challenge is to find a longest q-unique DNA sequence. This can be achieved by finding an Euler tour within the quotient graph of the De Bruijn graph (DBQG). For even q, self-complementary edges complicate the problem, and the graph has to be eulerized by deleting a minimum number of edges. It remains an open problem what is the minimum number of edges to delete for even q>6.

<div id="attachment_945" style="width: 904px" class="wp-caption aligncenter">
  <img class="wp-image-945 size-full" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/8-gram-graph-new.jpg" alt="8-gram-dbqg" width="894" height="839" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/8-gram-graph-new.jpg 894w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/8-gram-graph-new-300x282.jpg 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/8-gram-graph-new-768x721.jpg 768w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/8-gram-graph-new-624x586.jpg 624w" sizes="(max-width: 894px) 100vw, 894px" />
  
  <p class="wp-caption-text">
    <br /> A subgraph of a DBQG for q=8. The red edges are candidates for deletable edges. Black edges are non-deletable edges between two vertices with a self-complementary edge.<br />
  </p>
</div>

#### Discovery of maximal q-unique DNA subsequences:

Another interesting question is how maximal _qus_ (q-unique sequences) and _qcofs_ (q-complement sequences) are distributed in real genomes. In contrast to _qus_ _qcofs_ require just that for no q-gram the reverse complement is contained. Main questions are:

  * Are qus/qcofs randomly distributed within a genome?
  * Is there a pattern for some regions?
  * What differences can be found between bacteria and viruses?

<div id="attachment_950" style="width: 730px" class="wp-caption alignnone">
  <img class="wp-image-950 size-full" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/pihtosib_8_8_100.jpg" alt="pihtosib_8_8_100" width="720" height="495" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/pihtosib_8_8_100.jpg 720w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/pihtosib_8_8_100-300x206.jpg 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/07/pihtosib_8_8_100-624x429.jpg 624w" sizes="(max-width: 720px) 100vw, 720px" />
  
  <p class="wp-caption-text">
    Comparison between counts of maximal q-unique sequences in 100 simulated genomes and in real genome of a Pithovirus sibericum. The simulation was done with <a href="https://bitbucket.org/tobiasmarschall/mosdi" target="_blank">MoSDi</a>.
  </p>
</div>

#### Publications

  * Marianna D&#8217;Addario, Nils Kriege, Sven Rahmann: <a href="http://drops.dagstuhl.de/opus/volltexte/2012/3720/pdf/9.pdf" target="_blank">Designing q-Unique DNA Sequences with Integer Linear Programs and Euler Tours in De Bruijn Graphs.</a> In Proceedings of the GCB (Vol.26), pages 82&#8211;92, 2012.