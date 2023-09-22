#!/bin/bash
#SBATCH --job-name=r-fst
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/fst-stats/WINDOWS/r-fst-windows_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/fst-stats/WINDOWS/r-fst-windows_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/fst-stats/WINDOWS/

module load r
module load r-packages

Rscript --no-save ../../../../scripts/fst-values/r-fst-windows-SCRIPT.txt 























