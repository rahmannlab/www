---
title: '25.04.2016 | Publication: SimLoRD – Simulation of Long Read Data'
author: Genie
type: post
date: 2016-04-25T13:09:11+00:00
url: /2016/04/25/25-04-2016-publication-simlord-simulation-of-long-read-data/
categories:
  - bianca-stocker
  - Publication
  - sven-rahmann
tags:
  - PacBio
  - SimLoRD

---
**Bianca Stöcker; Johannes Köster; Sven Rahmann**
  
**Bioinformatics 2016;**
  
<a href="http://bioinformatics.oxfordjournals.org/content/early/2016/05/09/bioinformatics.btw286.abstract" target="_blank">10.1093/bioinformatics/btw286</a>

SimLoRD is a read simulator for third generation sequencing reads and is currently focused on the Pacific Biosciences SMRT error model.

Third generation sequencing methods provide longer reads than second generation methods and have distinct error characteristics.
  
In a SMRT library the sequenced DNA fragments are circular with adapter sequences between forward and backward strand, and a fragment may be sequenced multiple times in a single run. For a single pass through the sequence (subread), the error rate is high, but it is possible to calculate a consensus after multiple passes (circular consensus sequence read, CCS). Thus the error rate of CCSs decreases with the number of passes.

We analyzed public data from Pacific Biosciences (PacBio) SMRT sequencing, developed an error model and implemented it in a new read simulator called SimLoRD. Reads are simulated from both strands of a provided or randomly generated reference sequence. It offers options to choose the read length distribution and to model error probabilities depending on the number of passes through the sequencer. The new error model makes SimLoRD the most realistic SMRT read simulator available.

SimLoRD is available open source at <a href="http://bitbucket.org/genomeinformatics/simlord/" target="_blank">http://bitbucket.org/genomeinformatics/simlord/</a> and installable via <a href="http://bioconda.github.io" target="_blank">Bioconda</a>.