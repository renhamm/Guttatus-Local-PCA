#!/bin/bash
#SBATCH --job-name=step2
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=5:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files//fastEPRR/step2_jobX_vcf_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/fastEPRR/step2_jobX_vcf_generated-output.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

for((i=1;i<11;i++)); do sbatch fastEPRR_vcf_step2_jobX.txt ${i}; done

