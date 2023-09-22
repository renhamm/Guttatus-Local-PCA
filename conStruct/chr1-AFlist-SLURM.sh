#!/bin/bash
#SBATCH --job-name=r-fst
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/conStruct/r-chr1_all_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/r-chr1_all_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/conStruct/

module load r
module load r-packages

Rscript --no-save ../../scripts/conStruct/chr1-AFlist-SCRIPT.txt  























