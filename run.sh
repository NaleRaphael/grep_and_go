#!/bin/bash
# NOTE: modify this line according to the text search tool you want to use.
# Expected output format:
# ```
# <file_name>:<line_num>:<line_content>
# ```
_inputs=$(grep -nr "$@")

if [[ $? != 0 ]]; then
    echo "No input pattern, exiting"
    exit 1
fi

THIS_DIR="$(dirname "$(readlink -f "$0")")"
CALLER_CWD=$(pwd)
cd ${THIS_DIR} && echo "${_inputs}" | ./grep_and_go -w ${CALLER_CWD}
