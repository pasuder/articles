#!/usr/bin/env bash

BASE_NAME="${BASE_NAME:-article}"

for ARTICLE_PATH in $(find . -name "${BASE_NAME}.md")
do
    ARTICLE_DIR_PATH=$(dirname "${ARTICLE_PATH}")
    pushd "${ARTICLE_DIR_PATH}"
        pandoc \
            --filter pandoc-citeproc \
            --metadata citation-style=ieee.csl \
            --bibliography="${BASE_NAME}.bibtex" \
            -s "${BASE_NAME}.md" \
            -o "${BASE_NAME}.pdf"
    popd
done

