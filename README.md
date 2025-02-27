## This Bash script automates:
### downloading metagenomic sequencing data from the ENA database using SRAtoolkitit.
### Run PhaseFinder for inversion analysis.
### Remove the metagenomic sequences and save the results.
   
✅ Reads accession IDs from a CSV file
✅ Downloads metagenomic samples using fastq-dump
✅ Runs PhaseFinder algorithm on the downloaded data
✅ Logs success/failure in download_log.csv
✅ Deletes raw FASTQ files after processing to save space

This repository is designed for bioinformatics scientists who knows how to use phase finder and wish to explore phase variation in metagenomic samples that are stored in the European Nucleotide Archive.

## Useage
To use this script, update the following directory paths inside the Bash script before running it:

### CSV file containing accession names of the metagenomic samples
`input_file="./accessions.csv"`

### Directory where the results will be saved
`output_dir="path/to/output/directory"`

### Path to the `fastq-dump` executable from SRA Toolkit
`fastq_dump="~/sratoolkit.3.1.1-ubuntu64/bin/fastq-dump"`

### Path to the PhaseFinder algorithm (`PhaseFinder.py`)
`phasefinder_path="~/PhaseFinder/PhaseFinder.py"`


## Citation

This project uses methods or algorithms inspired by the following studies:

Jiang X, Hall AB, et al. *Invertible promoters mediate bacterial phase variation, antibiotic resistance, and host adaptation in the gut*, Science (2019).  
DOI: [10.1126/science.aau5238](https://doi.org/10.1126/science.aau5238)

NCBI SRA Toolkit: [SRA-Tools GitHub Repository](https://github.com/ncbi/sra-tools)  
National Center for Biotechnology Information. (2024). SRA Toolkit. GitHub repository.  
Available at: https://github.com/ncbi/sra-tools
