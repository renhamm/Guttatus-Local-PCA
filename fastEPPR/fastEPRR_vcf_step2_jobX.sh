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

module load r
module load r-packages
R --no-save << EOF
library(FastEPRR)
FastEPRR_VCF_step2(srcFolderPath = "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/fastEPRR/step1", jobNumber = 10, currJob = ${1}, DXOutputFolderPath = "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/fastEPRR/step2")
EOF

