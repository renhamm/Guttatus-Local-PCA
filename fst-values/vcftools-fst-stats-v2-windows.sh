#!/bin/bash
#SBATCH --job-name=vcftools-fst
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/fst-stats/WINDOWS/vcftools-fst-windows_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/fst-stats/WINDOWS/vcftools-fst-windows_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load bio/vcftools

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/fst-stats/WINDOWS/


set -- CR HAC HOL IM LPD MTC QRY SWC TBC TUN WLC;
for a; do
	shift;
	for b; do
		while IFS= read -r line; do
			chr=$(echo $line | cut -f 1 -d " ");
			start=$(echo $line | cut -f 2 -d " ");
			stop=$(echo $line | cut -f 3 -d " ");
			printf "%s-%s " "$a" "$b";
			echo "$chr $start $stop";
			vcftools --vcf ../../../original-vcf-files/v2-allchr.vcf  --chr $chr --from-bp $start --to-bp $stop --weir-fst-pop ../../../../indvlist/v2/indvlist-"$a".txt --weir-fst-pop ../../../../indvlist/v2/indvlist-"$b".txt --out $a-$b/$a-$b-$chr-$start-$stop;
		done;
	done;
done < ../../v2-WindowPositions.txt


























