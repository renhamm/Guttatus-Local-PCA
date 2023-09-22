#!/bin/bash
#SBATCH --job-name=specificWindows1
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/windows-of-interest/SNPmatrix-specificWindows_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/windows-of-interest/SNPmatrix-specificWindows_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load bio/vcftools
cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/

#SummerPrecip
vcftools --vcf v2-allchr.vcf --chr scaffold_8 --from-bp 1602885 --to-bp 1627316 --012 --out SNP-matrix-chr8_1602885_1627316 

vcftools --vcf v2-allchr.vcf --chr scaffold_14 --from-bp 13691627 --to-bp 13703711 --012 --out SNP-matrix-chr14_13691627_13703711

#SummerTemp
vcftools --vcf v2-allchr.vcf --chr scaffold_6 --from-bp 442986 --to-bp 448155 --012 --out SNP-matrix-chr6_442986_448155

#WinterTempandPrecip
vcftools --vcf v2-allchr.vcf --chr scaffold_14 --from-bp 24251622 --to-bp 24254557 --012 --out SNP-matrix-chr14_24251622_24254557

vcftools --vcf v2-allchr.vcf --chr scaffold_8 --from-bp 1726240 --to-bp 1749218 --012 --out SNP-matrix-chr8_1726240_1749218

#all
vcftools --vcfv2-allchr.vcf --chr scaffold_7 --from-bp 8251732 --to-bp 8290100 --012 --out SNP-matrix-chr7_8251732_8290100



