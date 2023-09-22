#!/bin/bash
#SBATCH --job-name=vcftools-pi
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/pi-stats/vcftools-pi_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/pi-stats/vcftools-pi_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load bio/vcftools

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/pi-stats/

for pop in CR HAC HOL IM LPD MTC SWC TBC TUN WLC; do
	vcftools --vcf /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/v2-allchr.vcf --keep ../indvlists/indvlist-"$pop".txt --site-pi --out "$pop"-gk-v2
	done
