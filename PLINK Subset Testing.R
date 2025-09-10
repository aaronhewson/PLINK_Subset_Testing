# Comparing the performance of PLINK for duplicate analysis, based on all high-quality SNPs or a selected subset.
# High-quality SNPs are those chosen by Axiom Analysis Suite as polymorphic and high-resolution.
# A subset of SNPs for comparison were chosen. These had missing call rate less than 0.01, minor allele frequency more than 0.3, and were pruned for linkage equilibrium.
# These were compared, as PLINK duplicate analysis relies on SNPs being in approximate linkage equilibrium (https://doi.org/10.1086/519795).


# Set Working Directory ---------------------------------------------------

#set working directory
setwd("C:/Users/curly/Desktop/Apple Genotyping/Methods/PLINK Subset Testing/Inputs")


# Run PLINK with All SNPs -------------------------------------------------

#PLINK dup matching
system("plink --file JD_PFR_PLINK --missing-genotype 0 --genome full")

#Convert plink.genome to a tab-delimited file
genome <- read.table("plink.genome", header = TRUE, sep = "", stringsAsFactors = FALSE)
write.table(genome, "plink_all_snps.txt", sep = "\t", row.names = FALSE, quote = FALSE)


# Create SNP Subset and Run PLINK -----------------------------------------

#Create subset of SNPs in PLINK
system("plink --file JD_PFR_PLINK --missing-genotype 0 --geno 0.01 --maf 0.3 --indep 50 5 1.5")


#PLINK dup matching
system("plink --file JD_PFR_PLINK --extract plink.prune.in --missing-genotype 0 --genome full")


#Convert plink.genome to a tab-delimited file
genome <- read.table("plink.genome", header = TRUE, sep = "", stringsAsFactors = FALSE)
write.table(genome, "plink_subset_snps.txt", sep = "\t", row.names = FALSE, quote = FALSE)
