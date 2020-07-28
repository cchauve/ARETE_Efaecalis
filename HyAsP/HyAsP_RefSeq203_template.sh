#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --mem=24G
#SBATCH --account=rrg-chauvec
#SBATCH --job-name=HyAsP_Efaecalis_XX

source activate py37
module load nixpkgs/16.09  gcc/7.3.0 blast+/2.9.0

GFADIR=/home/chauvec/wg-anoph/ARETE/data/ARETE_Efaecalis/McMaster/Unicycler_Assemblies_gfa
REFSEQ203DB=/home/chauvec/wg-anoph/ARETE/data/ARETE_Efaecalis/RefSeq/Hyasp.db.RefSeq_203.fasta
REFSEQ203DB_EFAECALIS=/home/chauvec/wg-anoph/ARETE/data/ARETE_Efaecalis/RefSeq/Hyasp.db.RefSeq_203_Efaecalis.fasta

echo "----------------------> Limited database"
OUTDIR=/home/chauvec/wg-anoph/ARETE/data/ARETE_Efaecalis/HyAsP/results/XX_Efaecalis
mkdir -p ${OUTDIR}
cd ${OUTDIR}
rm -f *
hyasp map    ${REFSEQ203DB_EFAECALIS} XX_Efaecalis_gcm.csv -g ${GFADIR}/XX.gfa -v
hyasp filter ${REFSEQ203DB_EFAECALIS} XX_Efaecalis_gcm.csv XX_Efaecalis_filtered_gcm.csv -v
hyasp find   ${GFADIR}/XX.gfa ${REFSEQ203DB_EFAECALIS} XX_Efaecalis_filtered_gcm.csv ${OUTDIR} -v

echo "----------------------> Full database"
OUTDIR=/home/chauvec/wg-anoph/ARETE/data/ARETE_Efaecalis/HyAsP/results/XX
mkdir -p ${OUTDIR}
cd ${OUTDIR}
rm -f *
hyasp map    ${REFSEQ203DB} XX_gcm.csv -g ${GFADIR}/XX.gfa -v
hyasp filter ${REFSEQ203DB} XX_gcm.csv XX_filtered_gcm.csv -v
hyasp find   ${GFADIR}/XX.gfa ${REFSEQ203DB} XX_filtered_gcm.csv ${OUTDIR} -v

