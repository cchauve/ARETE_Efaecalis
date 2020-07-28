#!/bin/bash

GFAS=`cat GFA.txt`
for GFA in ${GFAS}
do
    sed "s/XX/${GFA}/g" HyAsP_RefSeq203_template.sh > scripts/HyAsP_RefSeq203_${GFA}.sh
    chmod 755 scripts/HyAsP_RefSeq203_${GFA}.sh
    sbatch scripts/HyAsP_RefSeq203_${GFA}.sh
done
