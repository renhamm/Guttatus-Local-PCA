#!/bin/bash
#SBATCH --job-name=r-pi
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/invariant_files/r-pi-windows-invar_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/invariant_files/r-pi-windows-test-invar_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/original-vcf-files/invariant_files/

module load bio/vcftools

for pop in CR HAC HOL IM LPD MTC QRY SWC TBC TUN WLC; do
	vcftools --vcf mguttatus_S4_chr1ivar.vcf --site-pi --keep ../../indv-pops/indvlists/indvlist-"$pop".txt --out "$pop"-chr1-invar
	done
