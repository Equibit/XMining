#!/bin/bash

& "${PSScriptRoot}\project.ps1"

echo "docker run -v ${SOURCE_ROOT}:/src ${SOURCE_CONATINER} sh /src/${SOURCE_NAME}/scripts/${SOURCE_OS}/build.sh"
echo ""
      docker run -v ${SOURCE_ROOT}:/src ${SOURCE_CONATINER} sh /src/${SOURCE_NAME}/scripts/${SOURCE_OS}/build.sh
