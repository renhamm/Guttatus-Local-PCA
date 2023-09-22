#!/bin/bash
#SBATCH --job-name=bcftools-isec
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/thesis/localPCAproject/filtering/fileprep2_filtered_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/thesis/localPCAproject/filtering/fileprep2_filtered_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load gatk/3.8.0 
module load bio/vcftools

cd /global/scratch/laurenhamm/Data/thesis/localPCAproject/filtering/
java -Xmx108G -jar /clusterfs/vector/home/groups/software/sl-7.x86_64/modules/gatk/3.8.0/GenomeAnalysisTK.jar \
    -T SelectVariants \
    -R /global/scratch/laurenhamm/Data/thesis/localPCAproject/refgenome/MguttatusTOL_551_v5.021.fa \
    -V mgut5-SNP-ALLchr-final-maf-filtered10.recode.vcf \
    -selectType SNP \
    -o mgut5-SNP-ALLchr-filter10.vcf

java -Xmx108G -jar /clusterfs/vector/home/groups/software/sl-7.x86_64/modules/gatk/3.8.0/GenomeAnalysisTK.jar \
    -T VariantFiltration \
    -R /global/scratch/laurenhamm/Data/thesis/localPCAproject/refgenome/MguttatusTOL_551_v5.021.fa \
    -V mgut5-SNP-ALLchr-filter10.vcf \
    --filterExpression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
    --filterName "my_snp_filter" \
    -o mgut5-SNP-ALLchr-filtered-filter10.vcf
   
vcftools --vcf mgut5-SNP-ALLchr-filtered-filter10.vcf --max-missing 0.5 --remove-filtered-all --minQ 500  --recode --recode-INFO-all --min-alleles 2 --max-alleles 2 --out mgut5-SNP-ALLchr-filter10-final10
   
vcftools --vcf mgut5-SNP-ALLchr-filter10-final10.recode.vcf --012 --out SNP-matrix-ALLchr-filter10
