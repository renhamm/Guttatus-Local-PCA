#!/bin/bash
#SBATCH --job-name=LDJ
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/LDJump-IM-chr5_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/LDJump-IM-chr5_generated-output.txt

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/IM/chr5/
module load bio/vcftools
module load r
module load r-packages
module load r-spatial
R --no-save << EOF
library(LDJump)
LDJump("/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/v2-allchr-rename-IM.recode.newID.vcf", cores = 20, accept = TRUE, alpha = 0.05, pathLDhat = "~/LDhat/", pathPhi = "~/PhiPack/", format = "vcf", chr = 5, startofseq = 1, endofseq = 24699013, refName = "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/refgenome/Mgut_v2_chr5_rename.fa", lengthofseq = 24699013, out = "LDJump_IM_chr5")
EOF

