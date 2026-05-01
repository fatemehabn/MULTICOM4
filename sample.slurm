#!/bin/bash
#SBATCH -J sample2_48
#SBATCH -o ~/logs/h1312_48.%j.out
#SBATCH -e ~/logs/h1312_48.%j.err
#SBATCH -p  gpu-a100
#SBATCH -N 1                  # 1 Node
#SBATCH -n 128                 # 48 cores = 1 full SKX node
#SBATCH -t 48:00:00
#SBATCH -A MCB26003    # Your allocation


export TF_FORCE_UNIFIED_MEMORY=1
export XLA_PYTHON_CLIENT_MEM_FRACTION=4.0

source ~/miniconda3/bin/activate
conda activate multicom4
export PYTHONPATH=$MULTICOM4_DIR
cd $MULTICOM4_DIR

OPTION_FILE=
FASTA_PATH=
OUTPUT_DIR=
mkdir -p $OUTPUT_DIR
# Run your modified script
bash bin/multimer/run_multimer.sh "$OPTION_FILE" "$FASTA_PATH" "$OUTPUT_DIR"

