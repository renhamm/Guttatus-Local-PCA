#!/bin/bash
#SBATCH --job-name=vcftools-tajD
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/filtering/vcftools-tajD_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/filtering/vcftools-tajD_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load bio/vcftools

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/individual-pops/

for pop in CR HAC HOL IM LPD MTC QRY SWC TBC TUN WLC; do
	vcftools --vcf v2-"$pop"only.recode.vcf --TajimaD 10000 --out tajD-"$pop";
	done

