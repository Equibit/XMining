#!/bin/bash

SCRIPT=$(realpath $0)
PROJECT_SOURCE=$(dirname $(dirname $(dirname ${SCRIPT})))
PROJECT_BUILD=${PROJECT_SOURCE}/build/ubuntu

echo ""
echo "SCRIPT     = ${SCRIPT}"
echo "SOURCE     = ${PROJECT_SOURCE}"
echo "BUILD      = ${PROJECT_BUILD}"
echo ""

mkdir -p "${PROJECT_BUILD}" || exit 1

cd "${PROJECT_BUILD}" || exit 1

"${PROJECT_SOURCE}/autogen.sh" || exit 1

"${PROJECT_SOURCE}/configure" || exit 1

make || exit 1

strip bfgminer || exit 1

echo ""
echo "Build OK"
echo ""
