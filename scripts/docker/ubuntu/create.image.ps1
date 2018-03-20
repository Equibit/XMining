#!/bin/bash

& "${PSScriptRoot}\project.ps1"

echo "docker build -t ${SOURCE_CONATINER} ${PSScriptRoot}"
echo ""
      docker build -t ${SOURCE_CONATINER} ${PSScriptRoot}
