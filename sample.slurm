#!/bin/bash
#SBATCH -J sample2_48
#SBATCH -o /scratch/11208/ftmhabn/logs/h1312_48.%j.out
#SBATCH -e /scratch/11208/ftmhabn/logs/h1312_48.%j.err
#SBATCH -p  gpu-a100              # Stampede3 Skylake (Very high idle count!)
#SBATCH -N 1                  # 1 Node
#SBATCH -n 128                 # 48 cores = 1 full SKX node
#SBATCH -t 48:00:00
#SBATCH -A MCB26003    # Your allocation


export TF_FORCE_UNIFIED_MEMORY=1
export XLA_PYTHON_CLIENT_MEM_FRACTION=4.0
# Load environment
#source activate /work/11208/ftmhabn/ls6/miniconda3/envs/multicom4
source /work/11208/ftmhabn/ls6/miniconda3/bin/activate
conda activate multicom4
conda activate multicom4
export PYTHONPATH=/scratch/11208/ftmhabn/MULTICOM4/
cd /scratch/11208/ftmhabn/MULTICOM4/

OPTION_FILE='/scratch/11208/ftmhabn//MULTICOM4/bin/db_option'
FASTA_PATH='/scratch/11208/ftmhabn/fasta/h1312.fasta'
OUTPUT_DIR='/scratch/11208/ftmhabn/output/h1312_48'
mkdir -p $OUTPUT_DIR
# Run your modified script
bash bin/multimer/run_multimer.sh "$OPTION_FILE" "$FASTA_PATH" "$OUTPUT_DIR"

