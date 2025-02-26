#!/usr/bin/env bash

WORK_DIR=$(dirname "$(realpath "$0")")
cd "$WORK_DIR" || exit 1

vsce login wangchenglinclark
