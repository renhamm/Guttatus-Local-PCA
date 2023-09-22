#!/bin/bash
#SBATCH --job-name=admix-2
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/admixture/admix-cv_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/admixture/admix-cv_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd ~/admixture_linux-1.3.0/ 

for K in 1 2 3 4 5; \
do ./admixture --cv /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/admixture/v2-allchr-rename-plink.bed $K | tee log${K}.out; done

