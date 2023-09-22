#!/bin/bash
#SBATCH --job-name=bcftools-isec
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=2:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/fileprep_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/fileprep_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load bcftools

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/
bcftools concat -f bcf_filelist.txt -Ob -o mgut5-ALLchr.bcf
bcftools convert mgut5-ALLchr.bcf -Ov -o mgut5-ALLchr.vcf

