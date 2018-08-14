---
title: Library complexity and duplication rate estimation
author: Genie
type: page
date: 2016-07-22T18:39:27+00:00

---
<div dir="ltr">
  <p>
    <b>Christopher Schröder, Sven Rahmann</b>
  </p>
  
  <p>
    <b><a href="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/familyfull.png"><img class="alignright size-medium wp-image-899" src="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/familyfull-300x179.png" alt="familyfull" width="300" height="179" srcset="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/familyfull-300x179.png 300w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/familyfull-768x459.png 768w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/familyfull-1024x612.png 1024w, http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/familyfull-624x373.png 624w" sizes="(max-width: 300px) 100vw, 300px" /></a></b>In high-throughput sequencing (HTS) projects, the sequenced fragments’ duplicate rate is a key quality metric. A high duplicate rate may arise from a low amount of input DNA and many PCR cycles. Many methods for downstream analyses require that duplicates be removed. If the duplicate rate is high, most of the sequencing effort and money spent would have been in vain. Therefore, it is of considerable interest to estimate the duplicate rate after sequencing only a small subsample at low depth (multiplexed with other libraries) for quality control before running the full experiment. The problem is equal to the library complexity problem, which has numerous use cases, e.g. the prediction of species in an ecosystem or the estimation of different cells in tissues by taking subsamples.
  </p>
  
  <p>
    We developed an elementary mathematical framework and an efficient computational approach based on quadratic and linear optimization to estimate the complexity and duplication rate from a small subsample. Our method is based on up-sampling the occupancy distribution of the reads’ copy numbers. Compared to an existing approach, we use an explicit and easily explained mathematical model that accurately inverts the subsampling process.
  </p>
</div>

<div dir="ltr">
</div>