#!/bin/bash
#SBATCH --job-name=plink-ld
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/LD-stats/snp-thin_LD-ORonly_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/LD-stats/snp-thin_LD-ORonly_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd ~/Plink-files/ 

./plink --bfile /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/admixture/v2-allchr-rename-ORonly --r2 --ld-window-r2 0 --ld-window 99999 --ld-window-kb 8000 --out /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/LD-stats/snp-thin_ORonly

