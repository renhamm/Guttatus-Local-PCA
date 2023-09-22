#!/bin/bash
#SBATCH --job-name=fastEPRR_submit
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:10:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files//fastEPRR/step1_vcf_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/fastEPRR/step1_vcf_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

for((i=1;i<15;i++)); do sbatch fastEPRR_vcf_step1_chr${i}.txt; done


























