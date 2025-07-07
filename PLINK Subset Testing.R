#This script is for comparing the performance of PLINK in duplicate matching, between using all SNPs selected or a subset

#set working directory [must contain plink.exe and files for analysis]
setwd("C:/Users/curly/Desktop/PLINK Subset Testing/Inputs")


##Run PLINK with all SNPs

#PLINK dup matching
system("plink --file JD_PFR_PLINK --missing-genotype 0 --genome full")

#Convert plink.genome to a tab-delimited file
genome <- read.table("plink.genome", header = TRUE, sep = "", stringsAsFactors = FALSE)
write.table(genome, "plink_all_snps.txt", sep = "\t", row.names = FALSE, quote = FALSE)


##Run PLINK with SNP subset

#Create subset of SNPs in PLINK
system("plink --file JD_PFR_PLINK --missing-genotype 0 --geno 0.01 --maf 0.3 --indep 50 5 1.5")


#PLINK dup matching
system("plink --file JD_PFR_PLINK --extract plink.prune.in --missing-genotype 0 --genome full")


#Convert plink.genome to a tab-delimited file
genome <- read.table("plink.genome", header = TRUE, sep = "", stringsAsFactors = FALSE)
write.table(genome, "plink_subset_snps.txt", sep = "\t", row.names = FALSE, quote = FALSE)