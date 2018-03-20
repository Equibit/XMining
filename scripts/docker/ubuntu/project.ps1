#!/bin/bash

$Global:SOURCE_OS=Split-Path ${PSScriptRoot} -leaf

$Global:SOURCE_PATH=Split-Path (Split-Path (Split-Path ${PSScriptRoot}))
$Global:SOURCE_NAME=Split-Path ${SOURCE_PATH} -leaf
$Global:SOURCE_ROOT=Split-Path ${SOURCE_PATH}

$Global:SOURCE_CONATINER="${SOURCE_NAME}-${SOURCE_OS}"

echo ""
echo "Container: ${SOURCE_CONATINER}"
echo "Root:      ${SOURCE_ROOT}"
echo "Path:      ${SOURCE_PATH}"
echo "Name:      ${SOURCE_NAME}"
echo ""
