#!/usr/bin/env bash

# Configurable parameters
# NOTE: use full paths
PCAPS_DIR=/media/nate/wf-research/IoTDataset                # dataset
OUTPUT_DIR=/media/nate/wf-research/IoTDatasetProcessed      # output root
SIM_PATH=/home/nate/PycharmProjects/sdn-sim/bin/sim         # sim binary

# subdirectory names
IP=IP
NTP=NTP
DNS=DNS

# Begin script
mkdir ${OUTPUT_DIR}
for pcap_file in ${PCAPS_DIR}/*.pcap; do
    pcap_file=$(basename "${pcap_file}")
    echo "-> Processing ${pcap_file}"
    dir_name=(${pcap_file//.pcap/ })
    rm -rf ${OUTPUT_DIR}/${dir_name}
    mkdir ${OUTPUT_DIR}/${dir_name}

    echo -ne "-> Extracting IP flows ... "
    cur_dir=${OUTPUT_DIR}/${dir_name}/${IP}
    mkdir ${cur_dir}
    cd ${cur_dir}
    ${SIM_PATH} ${PCAPS_DIR}/${pcap_file} 0 >log 2>&1
    echo "done"

    echo -ne "-> Extracting NTP flows "
    cur_dir=${OUTPUT_DIR}/${dir_name}/${NTP}
    mkdir ${cur_dir}
    cd ${cur_dir}
    ${SIM_PATH} ${PCAPS_DIR}/${pcap_file} 1 >log 2>&1
    echo "done"

    echo -ne "-> Extracting DNS flows "
    cur_dir=${OUTPUT_DIR}/${dir_name}/${DNS}
    mkdir ${cur_dir}
    cd ${cur_dir}
    ${SIM_PATH} ${PCAPS_DIR}/${pcap_file} 2 >log 2>&1
    echo "done"
    echo "----------------------------------"
done
