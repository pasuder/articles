#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

BASE_NAME="${BASE_NAME:-article}"

BUILD_DIR="${DIR}/build"

mkdir "${BUILD_DIR}"

for ARTICLE_PATH in $(find "${DIR}" -name "${BASE_NAME}.pdf")
do
    ARTICLE_NAME=$(echo "${ARTICLE_PATH}" | awk -F'/' '{print $(NF-1)}')
    echo "Copying ${ARTICLE_PATH} to ${BUILD_DIR} as ${ARTICLE_NAME}.pdf"
    cp "${ARTICLE_PATH}" "${BUILD_DIR}/${ARTICLE_NAME}.pdf"
done

