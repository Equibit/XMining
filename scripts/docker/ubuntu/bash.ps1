#!/bin/bash

& "${PSScriptRoot}\project.ps1"

echo "docker run -v ${SOURCE_ROOT}:/src -it ${SOURCE_CONATINER} bash"
echo ""
      docker run -v ${SOURCE_ROOT}:/src -it ${SOURCE_CONATINER} bash
