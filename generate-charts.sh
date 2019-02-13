#!/usr/bin/env bash

set -e

command -v gnuplot >/dev/null 2>&1 || { echo >&2 "I require gnuplot but it's not installed. Skipping chart generation.."; exit 0; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

BASE_NAME="${BASE_NAME:-chart}"

for CHART_PATH in $(find "${DIR}" -name "${BASE_NAME}*.dem")
do
    CHART_DIR_PATH=$(dirname "${CHART_PATH}")
    pushd "${CHART_DIR_PATH}" >> /dev/null 2>&1
        gnuplot "${CHART_PATH}"
        echo "Generated chart ${CHART_PATH} in ${CHART_DIR_PATH}"
    popd >> /dev/null 2>&1
done

