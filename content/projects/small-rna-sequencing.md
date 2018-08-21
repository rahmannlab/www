---
title: Small RNA Sequencing
author: Genie
type: page
date: 2016-01-07T11:26:32+00:00

---
This website contains material on the analysis of small RNA, in particular miRNA, sequencing experiments. It refers to

  * a submitted manuscript &#8220;Identifying Transcriptional miRNA Biomarkers by Integrating High-Throughput Sequencing and Real-Time PCR Data&#8221;
  * the paper <a href="http://nar.oxfordjournals.org/cgi/content/abstract/gkq342v1" rel="nofollow">Deep sequencing reveals differential expression of microRNAs in favorable versus unfavorable neuroblastoma</a> by Schulte et al (2010).

<hr size="2" width="100%" />

## <a name="TOC-Supplementary-Material-for-Identifying-Transcriptional-miRNA-Biomarkers-by-Integrating-High-Throughput-Sequencing-and-Real-Time-PCR-Data-"></a>Supplementary Material for &#8220;Identifying Transcriptional miRNA Biomarkers by Integrating High-Throughput Sequencing and Real-Time PCR Data&#8221;

#### <a name="TOC-1"></a>

#### <a name="TOC-Accompanying-Sotware"></a>Accompanying Sotware

We provide a zip archive <a href="http://genomeinformatics.uni-due.de/wp-content/uploads/2016/01/normalize-mirna-expression.R.zip" rel="">normalize-mirna-expression.R</a> containing

  * the Snakefile with the workflow description
  * required Python scripts, as listed in Appendix A of the manuscript
  * a README file explaining how to set up the directory in which to run the pipeline
  * necessary files to initialize the pipeline directory

#### <a name="TOC-Other-required-software"></a>Other required software

  * [Python][1] (>= 3.2)
  * Python packages (Python3 versions): 
      * pysam
      * matplotlib with pdf output support
      * numpy
      * scipy
  * [snakemake][2] (>= 1.3)
  * [cutadapt][3] (>= 1.1)
  * [sqt][4]
  * [BWA][5] (version < 0.6 for color-space support)
  * [SAMtools][6]
  * [bedtools][7] (>= 2.16)

#### <a name="TOC-Required-Resources"></a>Required Resources

  * Human genome reference assembly [GRCh37][8],
  * ENSEMBL [genome annotation track][9] (version 67),
  * FASTA file with [mature miRNAs][10] of all organisms from the current miRBase release,
  * simiar FASTA file with [mature miRNAS][10] from the older miRBase release 8.1 (on which the RT-q-PCR kit was based)

#### <a name="TOC-Datasets"></a>Datasets

If you are interested in analyzing our neuroblastoma data, your can retrieve the ten datasets from the NCBI Sequence Read Archive using accession number SRA009986.

To convert the downloaded .SRA files to FASTQ, download the NCBI SRA SDK, and compile and install the fastq-dump binary to your $PATH. For a single SRA file, run

<pre class="brush: bash; title: ; notranslate" title="">fastq-dump -F SRR029966.sra
</pre>

The resulting .fastq file will have, curiously, a file name consisting of spaces, which needs to be fixed manually. In the following, we assume the datasets have been labelled 552.fastq, 553.fastq, &#8230;, 561.fastq (ten datasets in total). Our pipeline still expects color space fasta (.csfasta) and separate quality (.qual) files, as output by the SOLiD system.

<hr size="2" width="100%" />

&nbsp;

## <a name="TOC-Previous-Workflow"></a>Previous Workflow

The section below describes parts of our old workflow.
  
It is here for historical purposes only, it has been completely replaced by the Snakefile-based workflow.

#### <a name="TOC-Reference-Genome"></a>Reference Genome

Get the [1000 Genomes project reference file][11]. It is named human\_g1k\_v37.fasta.gz. You don&#8217;t need to unpack it.

Create a FASTA index of the reference:

<pre class="brush: bash; title: ; notranslate" title="">samtools faidx human_g1k_v37.fasta.gz</pre>

Create a BWA colorspace index (this may take a few hours):

<pre class="brush: bash; title: ; notranslate" title="">bwa index -a bwtsw -p hg1kv37 -c human_g1k_v37.fasta.gz</pre>

Remove adapters with cutadapt:

<pre class="brush: bash; title: ; notranslate" title="">mkdir reads/
for i in $(seq 552 561); do
cutadapt -c -e 0.12 -a 330201030313112312 -m 15 --bwa ${i}.fastq.gz \
&gt; reads/${i}.fastq.gz
done 
</pre>

Cutadapt is here instructed to

  * work with colorspace data (-c)
  * allow an error rate of 12 % (-e 0.12)
  * remove the adapter `330201030313112312`
  * discard reads shorter than 15 bp (-m 15)
  * create BWA-compatible output (&#8211;bwa). Please see the cutadapt command-line help for what this does exactly.

If you don&#8217;t use cutadapt, be aware that BWA especially has problems with empty sequences (length zero), negative quality values (which do occur in SOLiD data), and requires double-encoded FASTQ files in which the primer nucleotide and the first color have been removed.

<div>
  <h3>
    <a name="TOC-Align-reads"></a> Align reads
  </h3>
  
  <pre class="brush: bash; title: ; notranslate" title="">
for i in $(seq 552 561); do
bwa aln -n 3 -t 8 -c hg1kv37 reads/${i}.fastq | bwa samse hg1kv37 \
| samtools view -bS &gt; ${i}.unsorted.bam 
samtools sort ${i}.unsorted.bam ${i}
done
</pre>
  
  <p>
    If mapping was successful, you can delete the .unsorted.bam files.
  </p>
  
  <h4>
    <a name="TOC-Count-reads-mapping-to-miRNAs"></a>Count reads mapping to miRNAs
  </h4>
  
  <p>
    Get the <a href="ftp://mirbase.org/pub/mirbase/CURRENT/genomes/hsa.gff">miRBase GFF track</a>.
  </p>
  
  <p>
    Count reads mapping to miRNAs with htseq-count:
  </p>
  
  <p>
    htseq-count -i ID -t miRNA aligned.sam hsa.gff > counts.txt
  </p>
  
  <pre class="brush: bash; title: ; notranslate" title="">
for i in $(seq 552 561); do
samtools view -h $i.bam &gt; ${i}.sam &amp;&amp; \ 
htseq-count -i ID -t miRNA ${i}.sam hsa.gff &gt; ${i}.counts.txt && \
rm $i.sam
done
</pre>
  
  <p>
    Since htseq-count cannot read from BAM files and it had problems reading from standard input, we can neither use the BAM files directly nor pipe them into the tool. Instead, a temporary SAM file needs to be generated.
  </p>
  
  <h4>
    <a name="TOC-Convert-to-.expressions-files"></a> Convert to .expressions files
  </h4>
  
  <p>
    These files will be read in by the normalization script below.
  </p>
  
  <pre class="brush: bash; title: ; notranslate" title="">
for i in $(seq 552 561); do
echo "name count" &gt; ${i}.expressions
grep -v no_feature ${i}.counts.txt | grep -v ambiguous | tr '\t' ' ' \
&gt;&gt; ${i}.expressions 
done
</pre>
  
  <h4>
    <a name="TOC-Normalize-miRNA-counts"></a>Normalize miRNA counts
  </h4>
  
  <p>
    Get the attached <a href="http://www.rahmannlab.de/research/small-rna-sequencing/normalize-mirna-expression.R?attredirects=0">normalize-mirna-expression.R</a> script. Create a file named classes.txt that describes to which class each dataset belongs. In our case, it looks like this:
  </p>
  
  <pre class="brush: plain; title: ; notranslate" title="">dataset class
552 0
553 0
554 0
555 0
556 0
557 1
558 1
559 1
560 1
561 1
</pre>
  
  <p>
    Run the normalization script:
  </p>
  
  <pre class="brush: bash; title: ; notranslate" title="">
normalize-mirna-expression.R qqscale classes.txt
</pre>
  
  <p>
    For each dataset xyz that is mentioned in the <code>classes.txt</code>, the script reads in the corresponding xyz.expressions file. It then normalizes the data according to the given normalization method (qq-scale in this case, described in the paper) and creates a file <code>all.qqscale.expressions</code>. Some PDF plots are also generated in the current directory.
  </p>
  
  <p>
    The file all.qqscale.expressions is in CSV format (and can therefore be opened by a spread sheet program). In R, the file can be read in with the following code:
  </p>
  
  <pre class="brush: plain; title: ; notranslate" title="">
read.table('all.qqscale.expressions',sep=",",header=T,row.names=1)
</pre>
</div>

 [1]: http://www.python.org/
 [2]: http://code.google.com/p/snakemake/
 [3]: http://code.google.com/p/cutadapt/
 [4]: http://code.google.com/p/sqt/
 [5]: http://bio-bwa.sourceforge.net/
 [6]: http://samtools.sourceforge.net/
 [7]: http://code.google.com/p/bedtools/
 [8]: ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz
 [9]: ftp://ftp.ensembl.org/pub/release-67/gtf/homo_sapiens/Homo_sapiens.GRCh37.67.gtf.gz
 [10]: ftp://mirbase.org/pub/mirbase/CURRENT/mature.fa.gz
 [11]: ftp://ftp.sanger.ac.uk/pub/1000genomes/tk2/main_project_reference/human_g1k_v37.fasta.gz