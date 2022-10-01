#!/usr/bin/env bash

set -e

for sourcefile in /tmp/sources/*.sp; do
    outfile="$( basename "$sourcefile" .sp).smx"

    echo -n "$( date +'%T' ) Compiling $sourcefile ... "
  
    if ./spcomp $sourcefile -o/tmp/builds/$outfile -E | grep -i "error"; then
        echo "Failed"
        exit 1
    else
        echo "Success"
    fi
done

if [[ $1 == "watch" ]]; then
    /tmp/watch.sh
fi
