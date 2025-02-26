#!/usr/bin/env bash

set -e

WORK_DIR=$(dirname "$(realpath "$0")")
cd "$WORK_DIR" || exit 1

EXTENSIONS=$(ls extensions)
if [ -z "$EXTENSIONS" ]; then
    echo "***** Extensions Not Found. *****";
    exit 1;
fi

CHOOSED_EXT=
IFS=$'\n' && select CHOOSED_EXT in $(ls extensions | while IFS= read -r line; do echo "$line"$'\n'; done); do
    echo "> Choosed Extension:"$'\n' "$REPLY) $CHOOSED_EXT"
    break
done


if [ -z "$CHOOSED_EXT" ]; then
    echo "Aborting..."
    exit 2;
fi

echo "> Do you want to continue? (Y/n): "

read -r ANSWER
if [ "$ANSWER" = "n" ] || [ "$ANSWER" = "N" ]; then
    echo "Aborting..."
    # 退出脚本或执行其他操作
# if [ "$ANSWER" = "y" ] || [ "$ANSWER" = "Y" ]; then
else
    cd extensions/"$CHOOSED_EXT" && vsce publish
fi

exit 0
