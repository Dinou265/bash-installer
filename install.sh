#!/usr/bin/env bash
set -e

printf 'Starting installation...\n'

if command -v brew >/dev/null 2>&1; then
    brew update
    brew install tree
elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y tree
else
    printf 'No supported package manager found.\n' >&2
    exit 1
fi

printf 'Installation complete!\n'
