# Genome Compare

A modular and customizable pipeline for comparing genome assemblies of different species aligned to a single reference. This project enables the detection of homologous regions and shared genomic variants, aiming to explore interspecific differences with population-level tools.

---

## Example Species

The following *Saccharomyces* species are used as test cases in this project:

| Species                    | Accession           |
|---------------------------|---------------------|
| *S. cerevisiae* S288C     | GCF_000146045.2     |
| *S. paradoxus*            | GCF_002079055.1     |
| *S. kudriavzevii*         | GCF_947243775.1     |
| *S. mikatae*              | GCF_947241705.1     |
| *S. uvarum*               | GCA_947243795.1     |
| *S. bayanus*              | GCA_019431265.1     |
| *S. jurei*                | GCA_900290405.1     |
| *S. pastorianus*          | GCA_011022315.1     |
| *S. eubayanus*            | GCF_001298625.1     |

---

##  Project Structure

```
genome-compare-saccharomyces/
├── data/
│   ├── assemblies/           # All .fna genome files
├── env/
│   └── environment.yml       # Conda environment file
├── results/
│   ├── alignments/           # BAM files from alignment
│   ├── homologous_regions/   # BED files for shared regions (planned)
│   ├── variants/             # VCF files (planned)
│   └── plots/                # Visualizations (planned)
├── scripts/                  # All bash/python scripts
└── README.md                 # This file
```

---

### Requirements
- `conda` or `mamba`

### Environment Setup

```bash
conda env create -f env/environment.yml
conda activate genome-compare
```

---

## Running the Pipeline

### 1. Organize your data

Place all `.fna` genome assemblies into the folder:

```bash
data/assemblies/
```

Choose one of them as reference (e.g., *S. cerevisiae*):

```bash
cp data/assemblies/cerevisiae.fna data/reference/reference.fna
```

### 2. Align all genomes to the reference

```bash
bash scripts/align_to_reference.sh
```

This will generate sorted and indexed BAM files in `results/alignments/`.
