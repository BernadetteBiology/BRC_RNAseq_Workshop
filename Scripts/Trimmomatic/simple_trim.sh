#!/bin/bash

# Make these directories (-p flag indicates only do it, if these dont already exist)
# We want a new output directory 02_trimreads to store our trimmed reads
# We also want a log directory to store the information associated with the trimming process

mkdir -p ~/02_trimreads ~/02_trimreads/logs

# Here is our Trimmomatic command. This is what each part means:
# java -jar trimmomatic-0.36.jar = to run Trimmomatic, I need to tell the computer where my program  is
# PE = we are trimming paired end reads
# SRR19736866_1.fastq SRR19736866_2.fastq = these are my raw, untrimmed read files
# SRR19736866_R1_paired.fastq = the name of the output that contain the paired reads
# SRR19736866_R1_unpaired.fastq = the name of the output that  contain the unpaired reads (reads that do not have a matching pair)
# ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10:2:keepBothReads = This removes the Illumina adapters
# LEADING:3 TRAILING:3 = this removes the first and last 3 bases that are poor quality
# MINLEN:75 = this removes reads that are shorter than 75 bp
# &>> Trimmomatic_SRR19736866.log = this is where I want my log file to be saved

java -jar /home/ubuntu/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
  /home/ubuntu/01_fastqfiles/SRR19736866_1.fastq /home/ubuntu/01_fastqfiles/SRR19736866_2.fastq \
  /home/ubuntu/02_trimreads/SRR19736866_R1_paired.fastq /home/ubuntu/02_trimreads/SRR19736866_R1_unpaired.fastq \
  /home/ubuntu/02_trimreads/SRR19736866_R2_paired.fastq /home/ubuntu/02_trimreads/SRR19736866_R2_unpaired.fastq \
  ILLUMINACLIP:/home/ubuntu/Trimmomatic-0.36/adapters/TruSeq3-PE-2.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:75 \
  &>> /home/ubuntu/02_trimreads/logs/Trimmomatic_SRR19736866.log
