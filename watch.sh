#!/usr/bin/env bash

set -e

inotifywait -e close_write,moved_to,create -m /tmp/sources/ |
while read -r directory events filename; do
    sourcefile="/tmp/sources/$filename"
    outfile="$( basename "$sourcefile" .sp).smx"
    
    echo -n "$( date +'%T' ) Compiling $sourcefile ... "

    if ./spcomp $sourcefile -o/tmp/builds/$outfile | grep -i "error"; then
        echo "Failed"
    else
        echo "Success"
    fi
done

