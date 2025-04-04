#!/bin/bash

mkdir -p data/assemblies

while IFS=$'\t' read -r species url; do
  [[ "$species" == \#* ]] && continue
  echo "🔽 Downloading $species..."
  filename=$(basename "$url")
  wget -c "$url" -O "data/assemblies/${species}.fna.gz"
  gunzip -f "data/assemblies/${species}.fna.gz"
done < data/assemblies.tsv
