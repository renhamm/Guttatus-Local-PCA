#!/bin/bash
#SBATCH --job-name=LDJ
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=120:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files//LDJump/LDJump-IM-chr1_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/LDJump-IM-chr1_generated-output.txt

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/
module load bio/vcftools
module load r
module load r-packages
module load r-spatial
R --no-save << EOF
library(LDJump)
results = LDJump("/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/v2-allchr-rename-IM.recode.newID.vcf", cores = 20, accept = TRUE, alpha = 0.05, pathLDhat = "~/LDhat/", pathPhi = "~/PhiPack/", format = "vcf", chr = 1, startofseq = 1, endofseq = 13882368, refName = "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/refgenome/Mgut_v2_chr1_rename.fa", lengthofseq = 13882368, out = "LDJump_IM_chr1")

NameList = c("seq.full.cor.csv", "pr.full.cor.csv", "help.csv", "alpha.csv", "nn.csv", "ll.csv", "segs.csv")
count = 0
for (x in results){
	count = count + 1	
	write.csv(x, file=NameList[count])
}
EOF



