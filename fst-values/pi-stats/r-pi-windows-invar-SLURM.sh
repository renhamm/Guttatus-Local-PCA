#!/bin/bash
#SBATCH --job-name=r-pi
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/pi-stats/r-pi-windows-test-invar14_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/pi-stats/r-pi-windows-test-invar14_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/pi-stats/

module load r
module load r-packages


for num in 1 2 3 4 5 6 7 8 9 10 11 12 13 14; do
	Rscript --no-save ../../../scripts/fst-values/pi-stats/r-pi-windows-invar-chr"$num"-SCRIPT.txt 
	done






















