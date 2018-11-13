#!/bin/bash

FILE="/home/erik/anaconda3/bin/python"
WORKING_DIR="/home/erik/GPU_Malloc/benchmarks/scripts/tf_cnn_benchmarks/"
ARGUMENTS="/home/erik/GPU_Malloc/benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --num_gpus=1 --batch_size=16 --model=resnet50 --variable_update=parameter_server"
EXPORT_DIR="/home/erik/GPU_Malloc/nvvp"

cd ${WORKING_DIR}

nvprof --export-profile ${EXPORT_DIR}/timeline.prof ${FILE} ${ARGUMENTS}
nvprof --metrics achieved_occupancy,executed_ipc -o ${EXPORT_DIR}/metrics.prof ${FILE} ${ARGUMENTS}
nvprof --source-level-analysis pc_sampling -o ${EXPORT_DIR}/pcsampling.prof ${FILE} ${ARGUMENTS}
nvprof --analysis-metrics -o ${EXPORT_DIR}/analysis_metrics.prof ${FILE} ${ARGUMENTS}
