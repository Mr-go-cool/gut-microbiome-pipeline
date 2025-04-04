
#!/bin/bash

# Step 1: Install prerequisites
sudo apt update
sudo apt install -y build-essential cmake zlib1g-dev libbz2-dev liblzma-dev libboost-all-dev

# Step 2: Download MetaBAT2 source code
cd ~
wget https://github.com/toshiwoz/metabat2/archive/refs/heads/master.zip -O metabat2.zip
unzip metabat2.zip
cd metabat2-master

# Step 3: Build MetaBAT2
mkdir -p build && cd build
cmake ..
make -j$(nproc)

# Step 4: Move binaries to global path
sudo mv ./src/metabat2 /usr/local/bin/
sudo mv ./src/jgi_summarize_bam_contig_depths /usr/local/bin/
sudo mv ./src/contigOverlaps /usr/local/bin/

# Step 5: Confirm installation
metabat2 --version

# Example commands (you need to update the file paths yourself):
# jgi_summarize_bam_contig_depths --outputDepth depth.txt your_mapped_reads.bam
# metabat2 -i assembly.fa -a depth.txt -o output_bins
