---
title: Analysis of ion mobility spectroscopy data with restricted resources
author: Genie
type: page
date: 2016-01-07T11:16:20+00:00

---
**Dominik Kopczynski, Marianna D&#8217;Addario & Sven Rahmann
  
(Project TB1, SFB 876)**

Ion mobility spectrometry measures ion intensity S(_r_,_t_) of a mixture of molecules after a certain retention time _r_ in a separation phase and a certain drift time _t_ (&#8220;inverse ion mobility&#8221;) in the spectrometer. Different molecules generally lead to distinct peaks in the intensity signal; so it is theoretically possible to identify and quantify a number of different metabolites, for example in exhaled human breath. In practice, this is not trivial for a number of reasons:

  * Peaks in the spectrum may overlap and need to be de-mixed.
  * Low-intensity peaks are hard to distinguish from the inherent noise.
  * Spectra of complex mixtures are not necessarily the sums of spectra of single metabolites, because of ion interactions.

We have had some success in developing parametric models for peaks and estimating their parameters, while dealing with overlaps using EM-type algorithms.

The IMS technology is moving towards small, autonomous devices that can be carried almost anywhere. Even with modern mobile technology, however, the amount of data they generate, is too large to be sent to a central repository for analysis. This means that we must have **data analysis capabilities within the mobile IMS spectrometer**. This, on the other hand, consumes much of the **limited energy supply** of such a device. Especially the high memory requirements (currently about 280 MB for a full spectrum) contribute to the energy usage.

Our interest therefore focuses on analyzing each spectrum and reducing it to a few parametrized peaks, while the spectrum is generated (up to 10 minutes for a full high-resolution spectrum). Then, a few KB of memory would suffice for a mobile IMS device. Of course, not having the full spectrum available makes it harder to identify and quantify peaks. The question we currently investigate is about the trade-off between used resources (memory, energy, time) and peak recognition quality.
  
Downstream data analysis (alignment of peaks between different IMS spectra, identification of metabolites from peak characteristics) can then be done with the derived parametrized peaks, instead of the full raw data with acceptable loss of accuracy.

Another challenge is to predict peak characteristics from the chemical metabolite structure using statistical machine learning or methods. For other spectrometry technologies, especially mass spectrometry, this is trivial, as the mass of every molecule is simply the sum of its atom masses. Ion mobilities are not so easily predicted, however. Success in this task would free us from the need to manually create a database of measured reference peaks for each substance of interest.

* * *

# Materials related to our Publications

### <a name="TOC-Using-the-Expectation-Maximization-Algorithm-with-Heterogeneous-Mixture-Components-for-the-Analysis-of-Spectrometry-Data-2014-"></a>Using the Expectation Maximization Algorithm with Heterogeneous Mixture Components for the Analysis of Spectrometry Data (2014)

Available materials

  * Python code for the methods as [ZIP][1].
  * Evaluation material as [ZIP][2].

* * *

### <a name="TOC-PEAX:-A-Modular-Computational-Framework-for-Automated-Peak-Extraction-from-Ion-Mobility-Spectra-2014-"></a>PEAX: A Modular Computational Framework for Automated Peak Extraction from Ion Mobility Spectra (2014)

Available materials

  * Used Dataset (anonymized): [measurements][3] and [annotations][4].
  * The non-commercial software PEAX for [Linux_X64][5] and [sources][6] are freely available and for academic use only. Before using PEAX consider the [readme.txt][7].
  * Supplementary material can be downloaded [here][8].

<hr size="2" width="100%" />

### <a name="TOC-Peak-Detection-Method-Evaluation-for-Ion-Mobility-Spectrometry-by-using-Machine-Leaning-Approaches-2013-"></a>Peak Detection Method Evaluation for Ion Mobility Spectrometry by using Machine Leaning Approaches (2013)

Available materials

  * Sections of IMS measurements as [ZIP][9] or [BZ][10].
  * Supplementary material can be downloaded [here][11].

<hr size="2" width="100%" />

### <a name="TOC-Peak-Modeling-for-Ion-Mobility-Spectrometry-2012-"></a>Peak Modeling for Ion Mobility Spectrometry (2012)

Available materials

  * Sections of IMS measurements as [ZIP][12] or [BZ][13] with a list of [start parameters][14].
  * Visualization script in [python][15] or [gnuplot][16].

 [1]: http://ls11-www.cs.tu-dortmund.de/people/kopczyns/research/ims/using-em-python-scripts.zip
 [2]: http://ls11-www.cs.tu-dortmund.de/people/kopczyns/research/ims/using-em-data.zip
 [3]: http://ls11-www.cs.tu-dortmund.de/people/daddari/peax/dataset-peax-anonymized-measurements.zip
 [4]: http://ls11-www.cs.tu-dortmund.de/people/daddari/peax/dataset-peax-anonymized-annotations%20.zip
 [5]: http://ls11-www.cs.tu-dortmund.de/people/daddari/peax/peax1.0-LinuxX64.zip
 [6]: http://ls11-www.cs.tu-dortmund.de/people/daddari/peax/peax_sources.zip
 [7]: http://ls11-www.cs.tu-dortmund.de/people/daddari/peax/readme.txt
 [8]: http://ls11-www.cs.uni-dortmund.de/people/daddari/peax/supplements.pdf
 [9]: http://ls11-www.cs.tu-dortmund.de/%7Ekopczyns/research/ims/peak_detection_machine_learning_data.zip
 [10]: http://ls11-www.cs.tu-dortmund.de/%7Ekopczyns/research/ims/peak_detection_machine_learning_data.tar.bz
 [11]: http://ls11-www.cs.tu-dortmund.de/people/kopczyns/research/ims/supplementary.pdf
 [12]: http://ls11-www.cs.tu-dortmund.de/%7Ekopczyns/research/ims/peak_modeling_data.zip
 [13]: http://ls11-www.cs.tu-dortmund.de/%7Ekopczyns/research/ims/peak_modeling_data.tar.bz
 [14]: http://ls11-www.cs.tu-dortmund.de/%7Ekopczyns/research/ims/startparameter.csv
 [15]: http://ls11-www.cs.tu-dortmund.de/%7Ekopczyns/research/ims/visualize_python.py
 [16]: http://ls11-www.cs.tu-dortmund.de/%7Ekopczyns/research/ims/visualize_gnuplot.plot