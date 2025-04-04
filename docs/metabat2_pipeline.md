# MetaBAT 2 Pipeline Guide

MetaBAT 2 is a tool designed to sort and organize sequences in metagenomic datasets into groups called **bins**, where each bin represents a distinct genome. This helps in reconstructing genomes from complex microbial communities like those found in the human gut or the environment.

---

## What is MetaBAT 2?

MetaBAT 2 is an **adaptive binning algorithm** used in metagenomic analysis. It groups DNA sequences (contigs) into genome bins based on sequence composition and abundance across samples.

---

## Key Features

- **Adaptive Binning**  
  Automatically adjusts its parameters based on the dataset for improved accuracy.

- **Robustness**  
  Designed to handle noisy or incomplete metagenomic data.

- **Efficiency**  
  Optimized for speed, suitable for large-scale datasets.

- **User-Friendly**  
  Easy to use, even for researchers with limited programming skills.

---

## Applications

- **Environmental Microbiology**: Soil, water, ocean samples  
- **Human Microbiome Studies**: Gut, skin, oral microbiota  
- **Biogeochemistry**: Microbial roles in nutrient cycles and ecosystems

---

## Installation Guide

### Step 1: Install Prerequisites

```bash
sudo apt update
sudo apt install -y build-essential cmake zlib1g-dev libbz2-dev liblzma-dev libboost-all-dev
```

---

### Step 2: Download MetaBAT2 Source Code

```bash
cd ~
wget https://github.com/toshiwoz/metabat2/archive/refs/heads/master.zip -O metabat2.zip
unzip metabat2.zip
cd metabat2-master
```

---

### Step 3: Build MetaBAT2

```bash
mkdir -p build && cd build
cmake ..
make -j$(nproc)
```

---

### Step 4: Verify the Build

```bash
find . -name "metabat2" -type f
```

You should see a path like: `./src/metabat2`

---

### Step 5: Add MetaBAT2 to Your PATH

**Option 1: Move Binaries to Global Path**

```bash
sudo mv ./src/metabat2 /usr/local/bin/
sudo mv ./src/jgi_summarize_bam_contig_depths /usr/local/bin/
sudo mv ./src/contigOverlaps /usr/local/bin/
```

**Option 2: Add Build Directory to .bashrc**

```bash
echo 'export PATH=$PATH:~/metabat2-master/build/src' >> ~/.bashrc
source ~/.bashrc
```

---

### Step 6: Confirm Installation

```bash
metabat2 --version
```

If installed correctly, it will show the MetaBAT2 version.

---

## Running MetaBAT2

### Requirements:

- **Assembly file**: FASTA format (`assembly.fa`)
- **Depth file**: Generated using `jgi_summarize_bam_contig_depths`

### Example Command:

```bash
metabat2 -i /path/to/assembly.fa -a /path/to/depth.txt -o output_bins
```

- `-i`: Input assembly file (FASTA)
- `-a`: Depth file
- `-o`: Output prefix for bins

---

## How to Generate the Depth File

Before running MetaBAT2, generate the depth file:

```bash
jgi_summarize_bam_contig_depths --outputDepth depth.txt your_mapped_reads.bam
```

> Note: Your BAM file should be sorted and indexed (e.g., from Bowtie2 or BWA)

---

## Troubleshooting

- **Command not found**  
  Make sure `metabat2` is in your `PATH` (`echo $PATH` to check)

- **Errors during `cmake` or `make`**  
  Ensure all prerequisites were installed correctly (see Step 1)

- **Missing BAM or depth files**  
  Ensure your reads are mapped and you've generated `depth.txt`

---

## Summary

MetaBAT2 makes it easy to reconstruct genomes from complex metagenomic datasets. It's:

- Fast and accurate  
- Robust for noisy data  
- Simple to use in larger microbiome pipelines
