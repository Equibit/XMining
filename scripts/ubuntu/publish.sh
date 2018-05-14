#!/bin/bash

cd /root/EQB-Mining/build/ubuntu
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
