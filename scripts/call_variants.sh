#!/bin/bash

REF="data/assemblies/Saccharomyces_cerevisiae.fna"
mkdir -p results/variants/

for BAM in results/alignments/*.bam; do
    SAMPLE=$(basename "$BAM" .bam)
    echo "📊 Calling variants for $SAMPLE"
    
    bcftools mpileup -f "$REF" "$BAM" | \
        bcftools call -mv -Oz -o results/variants/${SAMPLE}.vcf.gz
    bcftools index results/variants/${SAMPLE}.vcf.gz
done
