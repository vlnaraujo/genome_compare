#!/bin/bash

# Reference genome: Saccharomyces cerevisiae
REF="data/assemblies/Saccharomyces_cerevisiae.fna"
mkdir -p results/alignments/

for GENOME in data/assemblies/*.fna; do
    SAMPLE=$(basename "$GENOME" .fna)
    
    if [[ "$GENOME" != *"cerevisiae"* ]]; then
        echo "🔗 Aligning $SAMPLE to reference..."
        minimap2 -ax asm5 "$REF" "$GENOME" | \
            samtools sort -o results/alignments/${SAMPLE}.bam
        samtools index results/alignments/${SAMPLE}.bam
    fi
done
