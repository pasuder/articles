#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

BASE_NAME="${BASE_NAME:-article}"

CSL_FILE_PATH="${CSL_FILE_PATH:-${DIR}/.csl/ieee.csl}"

BIB_EXT="${BIB_EXT:-bibtex}"
IN_EXT="${IN_EXT:-md}"
OUT_EXT="${OUT_EXT:-pdf}"


for ARTICLE_PATH in $(find "${DIR}" -name "${BASE_NAME}.md")
do
    ARTICLE_DIR_PATH=$(dirname "${ARTICLE_PATH}")
    pushd "${ARTICLE_DIR_PATH}" >> /dev/null 2>&1
        pandoc \
            --filter pandoc-citeproc \
            --metadata citation-style="${CSL_FILE_PATH}" \
            --bibliography="${BASE_NAME}.${BIB_EXT}" \
            -s "${BASE_NAME}.${IN_EXT}" \
            -o "${BASE_NAME}.${OUT_EXT}"
        echo "Generated article.${OUT_EXT} in ${ARTICLE_DIR_PATH}"
    popd >> /dev/null 2>&1
done

