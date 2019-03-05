# SDN-pcap-Simulator

## Build

1. Install libpcap headers
  * ``apt install libpcap-dev``
2. Compile the simulator
  * ``make``

## Usage

bin/sim [pcap-filename] [mode]

Mode
* 0 - Get all IP flows
* 1 - Get all NTP flows
* 2 - Get all DNS flows

## Scripts

downloadall.sh
* download traffic dataset

processall.sh
* extract streams from dataset using the sim
* NOTE: edit the script with your paths before running

## Output
All outputs will be stored in the directory from which the simulator is run. 