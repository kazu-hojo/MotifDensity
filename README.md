
# cal.motif.dens
Calculate input motif density of input bed file

## Requires
### R packages
* Biostrings
* stringr
* data.table

### Fasta file of input bed file
You have to convert bed file into fasta format first
e. g. Using bedtools
```
bedtools getfasta -fi genome.fa -bed input.bed > input.fa
```

## Installation
```
remotes::install_github("kazu-hojo/MotifDensity")
```

## Usage
```
cal.motif.dens(fasta, bed, motif)
```

## Argument
| Argument | Definition |
| ---- | ---- |
| fasta | Fasta file converted from input bed file |
| bed | Input bed file |
| motif | Input motif |

## Example
Calculate CpG density
```
input_CpG.bed <- cal.motif.dens("input.fa", "input.bed", "CG")
write.table(input_CpG.bed, "input_CpG_density.bed", row.names = FALSE, col.names = FALSE, sep = "\t", quote = F)
```
