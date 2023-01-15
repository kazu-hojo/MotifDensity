#' @name cal.motif.dens
#' @title Calculate motif density of input bed file
#' @description \code{cal.motif.dens} cal.motif.dens
#' @importFrom Biostrings readDNAStringSet
#' @importFrom Biostrings DNAString
#' @importFrom Biostrings reverse
#' @importFrom data.table fread
#' @importFrom stringr str_count
#' @param fasta Fasta file converted from input file by 'bedtools getfasta'
#' @param bed Input bed file
#' @param motif Input motif you want to calculate the density
#' @return Bed file added the column of calculated input motif density
#' @export
#' @example
#' #cal.motif.density("input.fa", "input.bed", "AGCT")

library("Biostrings")
library("stringr")
library("data.table")

cal.motif.dens <- function(fasta, bed, motif){
  fasta.file <- readDNAStringSet(fasta, format = "fasta")
  bed.file <- fread(bed, sep="\t", header=FALSE)
  motif.seq <- DNAString(x = motif)
  motif.reverse.seq <- reverse(motif.seq)
  motif_density <- rep(0, length(fasta.file))
  for (i in 1:length(fasta.file)) {
    motif_count <- str_count(as.character(fasta.file[[i]]), as.character(motif.seq))
    motif_reverse_count <- str_count(as.character(fasta.file[[i]]), as.character(motif.reverse.seq))
    motif_density[i] <- (motif_count + motif_reverse_count) / length(fasta.file[[i]])
  }
  bed.file$motif_density <- motif_density
  return(bed.file)
}
