#!/bin/bash
if [[ -z "${PLUTO_FILE}" ]]; then
    echo "Error: requires a file argument"
    exit 1
fi

if [[ "${PLUTO_IGNORE_DEPRECATIONS}" ]]; then
    PLUTO_ARGS="$PLUTO_ARGS --ignore-deprecations"
fi

if [[ "${PLUTO_IGNORE_REMOVALS}" ]]; then
    PLUTO_ARGS="$PLUTO_ARGS --ignore-removals"
fi

if [[ -n "${PLUTO_TARGET_VERSIONS}" ]]; then
    PLUTO_ARGS="$PLUTO_ARGS --target-versions k8s=${PLUTO_TARGET_VERSIONS}"
fi

export PLUTO_ARGS
export PLUTO_FILE_PATH

detect $PLUTO_FILE $PLUTO_ARGS
