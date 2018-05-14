#!/bin/bash

SCRIPT=$(realpath $0)
PROJECT_SOURCE=$(dirname $(dirname $(dirname ${SCRIPT})))
PROJECT_BUILD=${PROJECT_SOURCE}/build/ubuntu

echo ""
echo "SCRIPT     = ${SCRIPT}"
echo "SOURCE     = ${PROJECT_SOURCE}"
echo "BUILD      = ${PROJECT_BUILD}"
echo ""

cd "${PROJECT_BUILD}" 

if [ -f bfgminer ]; then 
   echo "Equibit miner found"
   mv bfgminer equibitminer
   git clone https://Equibit:f41c78627c23717323d6dc2a83fe9193b09b13f7@github.com/Equibit/MinerBinaries.git
   cd MinerBinaries
   mkdir -p dev/0.1/
   cp equibitminer MinerBinaries/dev/0.1/
   git add equibitminer
   git commit -am "Committed Equibit Miner v0.1"
   git push origin
else
    echo "Failed: Equibit miner not found"
fi
