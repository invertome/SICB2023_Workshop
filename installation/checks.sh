#!/bin/bash

prog_cmds=("hyphy" "orthofinder" "TransDecoder.LongOrfs" "iqtree" "mafft" "clipkit" "hmmsearch" "codeml" "run_treeshrink.py" "seqtk")

echo "Make sure you have activated the sicb2023 conda environment, 'conda activate sicb2023' , before running these checks."

# test if programs are working
for program in "${prog_cmds[@]}"
do
    if command -v $program &>/dev/null; then
        echo "$program is working properly"
    else
        echo "$program is not working properly"
    fi
done
