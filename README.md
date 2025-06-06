# Gut Microbiome – MetaBAT2 Binning Pipeline.. 

content
This repository currently contains step-by-step workflows and scripts for **genome binning using MetaBAT2**, a key step in analyzing gut microbiome metagenomic data.

More tools will be added soon as the full pipeline is built.

---

## Folder Structure

```
gut-microbiome-pipeline/
├── README.md                  <- You are here
├── docs/
│   └── metabat2_pipeline.md   <- MetaBAT2 documentation
├── scripts/
│   └── run_metabat2.sh        <- Shell script for MetaBAT2 install + run
├── data/
│   ├── raw/                   <- Input FASTQ/BAM files
│   └── processed/             <- Assembly, cleaned files, etc.
├── results/
│   └── bins/                  <- Output genome bins
└── env/                       <- Environment or install scripts (optional)
```

---

## MetaBAT2 Binning Pipeline

Detailed guide available in  
[`docs/metabat2_pipeline.md`](docs/metabat2_pipeline.md)

To run MetaBAT2 automatically from a terminal (after cloning this repo):

```bash
bash scripts/run_metabat2.sh
```

---

## Work in Progress

This project will soon include:
- FastQC for quality control
- Trimmomatic for adapter trimming
- Bowtie2 for host read removal
- Kraken2 for taxonomic profiling
- HUMAnN for functional profiling
- MEGAHIT for assembly

Stay tuned!

---

## Contact

For any questions or collaboration ideas, feel free to open an issue or contact me.
```
