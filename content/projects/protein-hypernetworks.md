---
title: Protein Hypernetworks
author: Genie
type: page
date: 2016-01-07T11:23:55+00:00

---
**Bianca Stöcker, Johannes Köster & Sven Rahmann,
  
collaboration with Eli Zamir (MPI Dortmund)**

<div>
  <a href="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/hypernetwork.png" rel="attachment wp-att-204"><img class="alignleft wp-image-204" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/hypernetwork-300x127.png" alt="hypernetwork" width="311" height="132" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/hypernetwork-300x127.png 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/hypernetwork-624x264.png 624w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/hypernetwork.png 708w" sizes="(max-width: 311px) 100vw, 311px" /></a>
</div>

Protein interactions are fundamental building blocks of biochemical reaction systems underlying cellular functions. The complexity and functionality of such systems emerge not from the protein interactions themselves but from the dependencies between these interactions. Therefore, a comprehensive approach for integrating and using information about such dependencies is required.

We present an approach for endowing protein networks with interaction dependencies using propositional logic, thereby obtaining _protein hypernetworks_. First we demonstrate how this framework straightforwardly improves the prediction of protein complexes. Next we show that modeling protein perturbations in hypernetworks, rather than in networks, allows to better infer the functional necessity of proteins for yeast. Furthermore, hypernetworks improve the prediction of synthetic lethal interactions in yeast, indicating their capability to capture high-order functional relations between proteins.

Protein hypernetworks are a consistent formal framework for modeling dependencies between protein interactions within protein networks. First applications of protein hypernetworks on the yeast interactome indicate their value for inferring functional features of complex biochemical systems.

Available materials:

  * Submitted paper: Johannes Köster, Eli Zamir, Sven Rahmann. Protein Hypernetworks: a Logic Framework for Interaction Dependencies and Perturbation Effects in Protein Networks; a preprint including the supplement is available at [arXiv: 1106.2562][1].
  * Supplementary data files ([zip][2] archive, 112 MB).
  * The [ProteinHypernetwork software suite][3] is available as open source from Google Code.
  * Definition of the [Hypernetwork Markup Language][4], the proposed exchange file format for protein hypernetworks.

 [1]: http://arxiv.org/abs/1106.2562
 [2]: http://ls11-www.cs.uni-dortmund.de/people/koester/ProteinHypernetworks/KoesterZamirRahmann2011ProteinHypernetworks_data.zip
 [3]: http://code.google.com/p/proteinhypernetworks/
 [4]: http://genomeinformatics.uni-due.de/research/hypernetworks/hypernetwork-markup-language-hypernetworkml/