#!/bin/bash
#SBATCH --job-name=plink-ld-bychr
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/LD-stats/plink-lists-bychr/LD-ORonly-bychr_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/LD-stats/plink-lists-bychr/LD-ORonly-bychr_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd ~/Plink-files/ 

for num in 1 2 3 4 5 6 7 8 9 10 11 12 13 14;
	do ./plink --bfile /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/admixture/v2-allchr-rename-ORonly --r2 --ld-window 99999 --ld-window-r2 0 --ld-window-kb 100 --chr $num --out /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/LD-stats/plink-v2-LD-ORonly-chr"$num";
	done


