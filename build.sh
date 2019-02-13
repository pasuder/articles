#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

bash "${DIR}/generate-charts.sh"
bash "${DIR}/generate-articles.sh"

