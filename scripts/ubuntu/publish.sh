#!/bin/bash

SCRIPT=$(realpath $0)
PROJECT_SOURCE=$(dirname $(dirname $(dirname ${SCRIPT})))
PROJECT_BUILD=${PROJECT_SOURCE}/build/ubuntu
MINER_NAME=equibitminer
MINER_VERSION=dev/0.1/$(date +%Y%m%d%H%M%S)

echo ""
echo "SCRIPT     = ${SCRIPT}"
echo "SOURCE     = ${PROJECT_SOURCE}"
echo "BUILD      = ${PROJECT_BUILD}"
echo ""

cd "${PROJECT_BUILD}" 

if [ -f bfgminer ]; then 
   echo "${MINER_NAME} found"
   mv bfgminer ${MINER_NAME}
   git clone https://Equibit:f41c78627c23717323d6dc2a83fe9193b09b13f7@github.com/Equibit/MinerBinaries.git
   cd MinerBinaries
   mkdir -p ${MINER_VERSION}
   cp ${PROJECT_BUILD}/${MINER_NAME} ${MINER_VERSION}
   git config --global user.name "Harmeek Jhutty"
   git config --global user.email "hjhutty@coderise.io"
   git add ${MINER_VERSION}/${MINER_NAME}
   git commit -m "Committed ${MINER_NAME} ${MINER_VERSION}"
   git push origin master
else
    echo "Failed: ${MINER_NAME} not found"
fi
