#!/bin/bash
#SBATCH --job-name=admix-FC
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/FC-files/admixture/admix-cv4_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/FC-files/admixture/admix-cv4_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd ~/admixture_linux-1.3.0/ 

for f in /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/FC-files/*plink.bed; do for K in 1 2 3 4 5 6 7 8; \
do ./admixture --cv $f $K | tee ${f}.log${K}.out; done; done

