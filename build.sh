#!/usr/bin/env bash

WORK_DIR=$(dirname "$(realpath "$0")")
cd "$WORK_DIR" || exit 1

cd extensions || exit

# cpp toolset
cd cpp_toolset || exit
delta=$(git diff package.json)
if [ -z "$delta" ]; then
    echo "... no changes and skipping build $(pwd)"
else
    rm -f mine-cpp-toolset-*.vsix
    vsce package
fi

# markdown toolset
cd .. && cd markdown_toolset || exit
delta=$(git diff package.json)
if [ -z "$delta" ]; then
    echo "... no changes and skipping build $(pwd)"
else
    rm -f mine-markdown-toolset-*.vsix
    vsce package
fi

# bash toolset
cd .. && cd bash_toolset || exit
delta=$(git diff package.json)
if [ -z "$delta" ]; then
    echo "... no changes and skipping build $(pwd)"
else
    rm -f mine-bash-toolset-*.vsix
    vsce package
fi

# python toolset
cd .. && cd python_toolset || exit
delta=$(git diff package.json)
if [ -z "$delta" ]; then
    echo "... no changes and skipping build $(pwd)"
else
    rm -f mine-python-toolset-*.vsix
    vsce package
fi
