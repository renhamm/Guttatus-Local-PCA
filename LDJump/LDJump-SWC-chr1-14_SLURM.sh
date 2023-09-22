#!/bin/bash
#SBATCH --job-name=LDJ-SWC
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=10:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/LDJump-SWC-chr1-14_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/LDJump/LDJump-SWC-chr1-14_generated-output.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

for file in LDJump-SWC-chr*_SCRIPT.sh; do sbatch $file; done

