#!/usr/bin/env bash
mapfile repos < <(for dir in *; do ( cd "$dir"; test -e .git && echo "$dir" ); done)

