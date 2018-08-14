---
title: Microarray Design and Layout
author: Genie
type: page
date: 2016-01-07T11:22:01+00:00

---
**Sergio A. de Carvalho Jr. & Sven Rahmann**

<a href="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/production.jpg" rel="attachment wp-att-211"><img class="alignleft size-full wp-image-211" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/production.jpg" alt="production" width="400" height="337" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/production.jpg 400w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/production-300x253.jpg 300w" sizes="(max-width: 400px) 100vw, 400px" /></a>Oligonucleotide microarrays consist of small DNA fragments (_probes_) chemically synthesized at specific locations (_spots_) of a solid surface. Probes are typically 25 to 60 nucleotides long and are synthesized in parallel, in a series of repetitive steps. Each step appends a particular nucleotide to selected regions of the chip. Selection occurs by exposure to light with the help of a photolithographic mask or micromirror arrays.

Regardless of which method is used to direct light (masks or micromirror arrays), it is possible that some probes are accidentally activated for chemical coupling because of light diffraction, scattering or internal reflection on the chip surface. This unwanted illumination of regions introduces unexpected nucleotides that change the probe sequences, significantly reducing their chances of successful hybridization with their targets, and introducing cross-hybridizations. This problem is more likely to occur near the borders between a masked and an unmasked spot (in the case of maskless synthesis, between a spot that is receiving light and a spot that is not); hence the term _border conflict_. 

By carefully designing the _arrangement_ of the probes on the chip and their _embeddings_ (the sequences of masked and unmasked steps used to synthesize each probe), it is possible to reduce the risk of unintended illumination. This issue becomes even more important as more probes need to be accommodated on a single chip, which require the production of spots at higher densities with reduced distances between the probes. Our aim is to design the layout of a microarray in such a way that we minimize the incidence of the unintended illumination problem, what we call the _microarray layout problem_ (MLP), using the term _layout_ to refer to where and how the probes are synthesized on the array, i.e., their arrangement and their embeddings.

The MLP appears to be hard because of the super-exponential number of possible arrangements, although no NP-hardness proof is yet known. Optimal solutions are thus unlikely to be found even for small chips and even if we assume that all probes have a single predefined embedding. If we consider all possible embeddings (up to several million for a typical probe), the MLP is even harder. For this reason, the problem has been traditionally tackled in two phases. First, an initial embedding of the probes is fixed and an arrangement of these embeddings on the chip with minimum conflicts is sought. This is usually referred to as the _placement_ phase. Second, a post-placement optimization phase _re-embeds_ the probes considering their location on the chip, in such a way that the conflicts with neighboring spots are further reduced. Often, the chip is _partitioned_ into smaller sub-regions before the placement phase in order to reduce running times, especially on larger chips.

## <a name="TOC-Conflict-Index-Model"></a>Conflict Index Model

The Border Length Minimization Problem [6] was the first formal definition of the problem of unintended illumination during the production of microarrays. The border length model evaluates the quality of a given mask.

We have developed a more general model, called conflict index [1-5], that estimates the risk of synthesizing a particular probe incorrectly. In our model we also take into account two practical considerations:

  * imperfections produced in the middle of a probe are more harmful than in it extremities;
  * stray light might activate not only immediate neighbors but also probes that lie as far as three cells away from the targeted spot.

## <a name="TOC-Greedy-and-GeneChip-Arrays"></a>Greedy+ and GeneChip Arrays

We have recently developed the first placement algorithm, called Greedy+, that for the first time combines the placement and embedding phases [1]. In [1], we also present the first large-scale layout-quality study on several old and recent GeneChip arrays, using Greedy+ to propose alternative layouts with reduced conflicts. Our analysis is based on the specification obtained from  [Affymetrix&#8217;s web site][1] containing the list of probe sequences and their positions on the chip.

#### <a name="TOC-Original-Layouts"></a> Original Layouts

Most GeneChip arrays for gene expression analysis, such as the Wheat Genome array, are synthesized in 74 steps, whereas the most recent genotyping arrays tend to use a 80-step sequence. On many GeneChip arrays, the probes appear in pairs: the perfect match (PM), which perfectly matches its target sequence, and the mismatch (MM) probe, which is used to quantify cross-hybridizations and unpredictable background signal variations. The MM probe is a copy of the PM probe except for the middle base (position 13 of the 25-mer), which is exchanged with its Watson-Crick complement. The layout of these arrays alternates rows of PM probes with rows of MM probes in such a way that the probes of a pair are always adjacent on the chip. Moreover, PM and MM probes are usually _pair-w__ise_ right-most embedded. Informally, a pair-wise right-most embedding is obtained from right-most embeddings by shifting the first half of one embedding to the left until the two embeddings are &#8220;aligned&#8221; in the synthesis steps that precede the mismatched middle bases. This approach reduces border conflicts between the probes of a pair, but it leaves a conflict in the steps that add the middle bases.

<a href="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/genechip.png" rel="attachment wp-att-223"><img class="alignleft size-medium wp-image-223" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/genechip-300x200.png" alt="genechip" width="300" height="200" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/genechip-300x200.png 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/genechip-624x416.png 624w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/genechip.png 750w" sizes="(max-width: 300px) 100vw, 300px" /></a>The latest Genome-wide Human SNP arrays do not contain PM/MM probe pairs. Most of the probes on these arrays, however, are also designed in pairs to target the two possible alleles of a given SNP position. These probes are identical except for one nucleotide. Unlike PM/MM probes, the mismatched base is not necessarily its Watson-Crick complement, and the mismatch position can be anywhere between bases 9 and 17, inclusive, of the 25-mer. On the Human SNP 6.0 array, one of the latest GeneChip arrays, the probes of a pair are located on adjacent positions on the chip and are pair-wise right-most embedded. In contrast, on the Human SNP 5.0 array, all probes were tiled as single probes, i.e., they do not necessarily occupy adjacent positions on the chip, and they are right-most embedded (but not pair-wise aligned). The figure shows the NBL for each masking step of three commercially available GeneChip arrays: Wheat Genome, Human SNP 5.0 and Human SNP 6.0. An analysis of their layouts suggests three different placement strategies.

Both SNP arrays have the peculiarity that all SNP probes are replicated in four identical copies that are guaranteed to be physically separated on the chip with a minimum distance of 1mm. This is achieved by partitioning the chip into four quadrants that are separated by a 1mm-thick central cross, which mainly contains copy number (CN) probes and control probes. Each copy of a SNP probe is placed on a different quadrant and, thus, each quadrant can be designed independently.

&nbsp;

#### Alternative Layouts

<a href="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/greedyplus-cim.png" rel="attachment wp-att-222"><img class="alignleft size-medium wp-image-222" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/greedyplus-cim-300x200.png" alt="greedyplus-cim" width="300" height="200" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/greedyplus-cim-300x200.png 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/greedyplus-cim-624x416.png 624w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/greedyplus-cim.png 750w" sizes="(max-width: 300px) 100vw, 300px" /></a>We used our new algorithm Greedy+ [1] with different parameters $Q$ and Sequential re-embedding to create alternative layouts for the Wheat Genome array and for the top-left quadrants of both Human SNP arrays. For each chip we separately run both BLM and CIM versions of the algorithms. The main difference between our layouts and the original ones is that we do not require the arrays to alternate rows of PM and MM probes, nor do we place SNP probe pairs on adjacent spots. This is especially helpful for CIM since it avoids conflicts in the middle bases. With BLM, we observe that Greedy+ places between 90.7% and 91.5% of the probe pairs of the Wheat array on adjacent spots. With CIM, this rate drops to between 13.0% and 17.6%. The figure shows the NBL for each masking step of the layout produced by Greedy+ for the top-left quadrant of the SNP 6.0 array in comparison with the original Affymetrix layout. It can be seen that the CIM variant of our algorithm, using variable instead of right-most embeddings, is able to distribute the addition of middle bases over a larger range of synthesis steps (masks 20-60, approximately) and significantly reduce the incidence of border conflicts in these steps, where conflicts are expensive.

## 

## Pivot Partitioning

We have developed a partitioning algorithm, called Pivot Partitioning [3], that combines the partitioning of the chip with the embedding of the probes. The main advantages of our approach over previous methods are: faster and better selection of pivots used to drive the assignment of probes to sub-regions; and improved assignment of probes to regions by considering all valid embeddings of a probe. Our algorithm outperforms the previous partitioning algorithms by over 8%.

## <a name="TOC-Microarray-Layout-as-a-Quadratic-Assignment-Problem"></a>Microarray Layout as a Quadratic Assignment Problem

We have recently showed that the Microarray Placement Problem is an instance of the Quadratic Assignment Problem (QAP) [8,9]. The QAP is a classical combinatorial optimization problem that is, in general, NP-hard, and particularly hard to solve in practice. Here are some QAP instances derived from our models and the best solutions computed with QAP solvers.

The problem instances were derived from small artificial microarrays containing between 36 and 144 probes. These probes must be assigned to specific locations of the chip (spots), whose dimensions range from 6&#215;6 to 12&#215;12. Once the assignment is made, there are two models that evaluate the quality of the layout: **border length** and **conflict index** (these models are somewhat correlated, i.e. a good layout has both low border length and low conflict indices).

In our formulations, the _flow_ matrix contains the Euclidean distance between the spots, while the _distance_ matrix contains the (weighted) Hamming distance between the probe embeddings. The chips available here are square in shape and thus, for every solution, there are another seven **symmetrical solutions**.

Because of the large number of probes on industrial microarrays (up to 1.3 million probes), it is not feasible to use any QAP method to design an entire microarray chip. However, it is certainly possible to design or improve small sub-regions of a chip. Since the instances that we work on are only a small part of the whole problem, we are more interested in methods that can solve a QAP rather quickly (in a few minutes). Nonetheless, we also report here results obtained with other time-consuming approaches.

Note that the results that appeared in [5] are averages over three runs on a set of ten random files uniformely generated (the files available here are only the first file of each set).

#### <a name="TOC-File-Formats"></a>File Formats

Problems and solutions are available as plain text files with the formats used by <a href="http://www.seas.upenn.edu/qaplib/" rel="nofollow">QAPLIB</a>. The format of the problem file is:

<center>
  n<br /> <i>A</i><br /> <i>B</i>
</center>where n is the size of the instance, 

_A_ and _B_ are _flow_ and _distance_ matrices, respectively. The format of the solution file is:

<center>
  n  sol<br /> p       
</center>where n gives the size of the instance, sol is the objective function value and p is the corresponding permutation.

#### <a name="TOC-Problem-Instances-and-Solutions"></a>Problem Instances and Solutions

The results obtained with GRASP with Path Relinking (GRASP-PR) [3] used default parameters (32 iteractions, alpha = beta = 0.5) and finished in less than 5 minutes each. The solutions found with RTL-1 [4] and RTL-2 [5] were reported by Dr. Peter Hahn, with running times ranging from 6.7 to 29.2 hours on a Dell 7150 733 MHz Itanium CPU. Chris MacPhee reported the best solutions so far (obtained by a QAP solver), using GATS [6], a hybrid genetic / tabu search algorithm, with running times ranging from 84 seconds to 479 hours. This page will be updated when we hear about better solutions.

To download all problem instances and GRASP-PR solutions, click <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/chip_qap.tar.gz" rel="nofollow">here</a>.

### Border Length Minimization

<table>
  <tr>
    <td>
      Chip size
    </td>
    
    <td>
      Name
    </td>
    
    <td>
      Dimension (n)
    </td>
    
    <td>
      Best known solution
    </td>
    
    <td>
      Other solutions
    </td>
  </tr>
  
  <tr>
    <td>
      6&#215;6
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-6x6-36-25-AFFY-00_rand_rand_bl.dat" rel="nofollow">RAND-S-6&#215;6-36-25-AFFY-00_rand_rand_bl</a>
    </td>
    
    <td>
      36
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">3,296</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/rtl-2/RAND-S-6x6-36-25-AFFY-00_rand_rand_bl_01.sln" rel="nofollow">3,304</a>(RTL-2)<br /> <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/rtl-2/RAND-S-6x6-36-25-AFFY-00_rand_rand_bl_02.sln" rel="nofollow">3,304</a>(RTL-2)<br /> <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-6x6-36-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">3,352</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      7&#215;7
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-7x7-49-25-AFFY-00_rand_rand_bl.dat" rel="nofollow">RAND-S-7&#215;7-49-25-AFFY-00_rand_rand_bl</a>
    </td>
    
    <td>
      49
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">4,564</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/rtl-1/RAND-S-7x7-49-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">4,580</a>(RTL-1)<br /> <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-7x7-49-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">4,660</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      8&#215;8
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-8x8-64-25-AFFY-00_rand_rand_bl.dat" rel="nofollow">RAND-S-8&#215;8-64-25-AFFY-00_rand_rand_bl</a>
    </td>
    
    <td>
      64
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">6,048</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/rtl-1/RAND-S-8x8-64-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">6,080</a>(RTL-1)<br /> <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-8x8-64-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">6,200</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      9&#215;9
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-9x9-81-25-AFFY-00_rand_rand_bl.dat" rel="nofollow">RAND-S-9&#215;9-81-25-AFFY-00_rand_rand_bl</a>
    </td>
    
    <td>
      81
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">7,644</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-9x9-81-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">7,900</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      10&#215;10
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-10x10-100-25-AFFY-00_rand_rand_bl.dat" rel="nofollow">RAND-S-10&#215;10-100-25-AFFY-00_rand_rand_bl</a>
    </td>
    
    <td>
      100
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">9,432</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-10x10-100-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">9,684</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      11&#215;11
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-11x11-121-25-AFFY-00_rand_rand_bl.dat" rel="nofollow">RAND-S-11&#215;11-121-25-AFFY-00_rand_rand_bl</a>
    </td>
    
    <td>
      121
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">11,640</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-11x11-121-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">12,032</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      12&#215;12
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-12x12-144-25-AFFY-00_rand_rand_bl.dat" rel="nofollow">RAND-S-12&#215;12-144-25-AFFY-00_rand_rand_bl</a>
    </td>
    
    <td>
      144
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">13,832</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-12x12-144-25-AFFY-00_rand_rand_bl.sln" rel="nofollow">14,196</a>(GRASP-PR)
    </td>
  </tr>
</table>

### <a name="TOC-Conflict-Index-Minimization"></a>Conflict Index Minimization

<table>
  <tr>
    <td>
      Chip size
    </td>
    
    <td>
      Name
    </td>
    
    <td>
      Dimension (n)
    </td>
    
    <td>
      Best known solution
    </td>
    
    <td>
      Other solutions
    </td>
  </tr>
  
  <tr>
    <td>
      6&#215;6
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-6x6-36-25-AFFY-00_rand_rand_ci.dat" rel="nofollow">RAND-S-6&#215;6-36-25-AFFY-00_rand_rand_ci</a>
    </td>
    
    <td>
      36
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">169,016,907</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-6x6-36-25-AFFY-00_rand_rand_ci.sln" rel="nofollow">169,925,219</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      7&#215;7
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-7x7-49-25-AFFY-00_rand_rand_ci.dat" rel="nofollow">RAND-S-7&#215;7-49-25-AFFY-00_rand_rand_ci</a>
    </td>
    
    <td>
      49
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">237,077,377</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-7x7-49-25-AFFY-00_rand_rand_ci.sln" rel="nofollow">238,859,844</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      8&#215;8
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-8x8-64-25-AFFY-00_rand_rand_ci.dat" rel="nofollow">RAND-S-8&#215;8-64-25-AFFY-00_rand_rand_ci</a>
    </td>
    
    <td>
      64
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">326,696,412</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-8x8-64-25-AFFY-00_rand_rand_ci.sln" rel="nofollow">327,770,071</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      9&#215;9
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-9x9-81-25-AFFY-00_rand_rand_ci.dat" rel="nofollow">RAND-S-9&#215;9-81-25-AFFY-00_rand_rand_ci</a>
    </td>
    
    <td>
      81
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">428,682,120</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-9x9-81-25-AFFY-00_rand_rand_ci.sln" rel="nofollow">434,317,170</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      10&#215;10
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-10x10-100-25-AFFY-00_rand_rand_ci.dat" rel="nofollow">RAND-S-10&#215;10-100-25-AFFY-00_rand_rand_ci</a>
    </td>
    
    <td>
      100
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">525,401,670</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-10x10-100-25-AFFY-00_rand_rand_ci.sln" rel="nofollow">532,573,788</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      11&#215;11
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-11x11-121-25-AFFY-00_rand_rand_ci.dat" rel="nofollow">RAND-S-11&#215;11-121-25-AFFY-00_rand_rand_ci</a>
    </td>
    
    <td>
      121
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">658,317,466</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-11x11-121-25-AFFY-00_rand_rand_ci.sln" rel="nofollow">664,137,090</a>(GRASP-PR)
    </td>
  </tr>
  
  <tr>
    <td>
      12&#215;12
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/RAND-S-12x12-144-25-AFFY-00_rand_rand_ci.dat" rel="nofollow">RAND-S-12&#215;12-144-25-AFFY-00_rand_rand_ci</a>
    </td>
    
    <td>
      144
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/gats/GATS.sln" rel="nofollow">803,379,686</a>(GATS)
    </td>
    
    <td>
      <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/qap/files/grasp-pr/RAND-S-12x12-144-25-AFFY-00_rand_rand_ci.sln" rel="nofollow">813,127,758</a>(GRASP-PR)
    </td>
  </tr>
</table>

&nbsp;

## <a name="TOC-Contact"></a>Contact

For more information, please contact [Sven Rahmann][2].

## <a name="TOC-References"></a>References

[1] S. A. de Carvalho Jr. and S. Rahmann. **Improving the design of GeneChip arrays by combining placement and embedding**. _Proceedings of the 6th Annual International Conference on Computational System Bioinformatics_ (CSB), 2007. <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/pub/csb2007.pdf" rel="nofollow">Preview</a> (PDF).

[2] S. A. de Carvalho Jr. and S. Rahmann. **Modeling and optimizing oligonucleotide microarray layout.** In Ion Mandoiu and Alexander Zelikovsky, editors, _<a href="http://dna.engr.uconn.edu/BA" rel="nofollow">Bioinformatics Algorithms: Techniques and Applications</a>_, Wiley Book Series on Bioinformatics. Wiley.

[3] S. A. de Carvalho Jr. and S. Rahmann. **Improving the layout of oligonucleotide microarrays: Pivot Partitioning**. In P. Bucher et al., editors, _Proceedings of the 6th Workshop of algorithms in Bioinformatics_ (WABI), volume 4175 of _Lecture Notes in Computer Science_, pages 321-332. Springer, 2006. <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/pub/wabi2006.pdf" rel="nofollow">Preview</a> (PDF).

[4] S. A. de Carvalho Jr. and S. Rahmann. **Microarray layout as a quadratic assignment problem**. In D. Hudson et al., editors, _Proceedings of the German Conference on Bioinformatics_ (GCB), volume P-83 of _Lecture Notes in Informatics_, pages 11-20. Gesellschaft für Informatik, 2006. <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/pub/gcb2006.pdf" rel="nofollow">Preview</a> (PDF).

[5] S. A. de Carvalho Jr. and S. Rahmann. **Microarray layout and the quadratic assignment problem** (poster). 14th Annual International Conference on Intelligent Systems for Molecular Biology (ISMB), Fortaleza, Brazil, 2006. <a href="http://gi.cebitec.uni-bielefeld.de/comet/chiplayout/pub/ismb2006.pdf" rel="nofollow">Preview</a> (PDF).

[6] S. Hannenhalli, E. Hubell, R. Lipshutz, and P. A. Pevzner. Combinatorial algorithms for design of DNA arrays. _Advances in Biochemical Engineering Biotechnology, 77:1-19, 2002._

[7] Oliveira, C.A.S., Pardalos, P.M. and Resende, M.G.C. (2004): **GRASP with Path-relinking for the Quadratic Assignment Problem**. In Ribeiro, C.C. and Martins, S.L. (eds.), _Efficient and Experimental Algorithms_, LNCS, **3059**, 356-368, Springer-Verlag.

[8] Hahn, P., Grant, T. and Hall, N. (1998): **A Branch-and-bound Algorithm for the Quadratic Assignment Problem Based on the Hungarian Method**. European Journal of Operational Research, 108, 629-640.

[9] Adams, W., Guignard, M., Hahn, P. and Hightower, W.: **A Level-2 Reformulation Linearization Technique Lower Bound for the Quadratic Assignment Problem**. To appear in the European Journal of Operational Research.

[10] Rodriguez, J.M., MacPhee, F.C., Bonham, D.J., Horton, J.D. and Bhavsar, V.C. (2004): **Best Permutations for the Dynamic Plant Layout Problem**. In Dasgupta, A.R., Iyengar, S.S., and Bhatt, H.S. (Eds.): Proceedings of the 12th International Conference on Advances in Computing and Communications (ADCOM 2004), Allied Publishers Pvt. Ltd., New Delhi Ahmedabad, India, 15-18 Dec., ISBN 81-7764-717-2, pp.173-178.

 [1]: http://www.affymetrix.com/support/technical/byproduct.affx?cat=arrays
 [2]: http://genomeinformatics.uni-due.de/people/rahmann