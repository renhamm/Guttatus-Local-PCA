#!/bin/bash
#SBATCH --job-name=LDJ
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/LDJump-SWC-chr11_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/LDJump-SWC-chr11_generated-output.txt

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/SWC/chr11/
module load bio/vcftools
module load r
module load r-packages
module load r-spatial
R --no-save << EOF
library(LDJump)
LDJump("/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/v2-allchr-rename-SWC.recode.newID.vcf", cores = 20, accept = TRUE, alpha = 0.05, pathLDhat = "~/LDhat/", pathPhi = "~/PhiPack/", format = "vcf", chr = 11, startofseq = 1, endofseq = 25976587, refName = "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/refgenome/Mgut_v2_chr11_rename.fa", lengthofseq = 25976587, out = "LDJump_SWC_chr11")
EOF

