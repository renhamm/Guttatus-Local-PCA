#!/bin/bash
#SBATCH --job-name=step1_chr1
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=1:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files//fastEPRR/step1_chr1_vcf_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/fastEPRR/step1_chr1_vcf_generated-output.txt

module load r
R --no-save << EOF
library(FastEPRR)
FastEPRR_VCF_step1(vcfFilePath = "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/v2-chr1-filt-phased.vcf.gz", winLength = 10000, srcOutputFilePath = "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/fastEPRR/step1/chr1")
EOF

