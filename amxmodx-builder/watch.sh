#!/usr/bin/env bash

set -e

inotifywait -e close_write,moved_to,create -m /home/builder/sources/ |
while read -r directory events filename; do
    sourcefile="/home/builder/sources/$filename"
    outfile="$( basename "$sourcefile" .sma).amxx"
    
    echo -n "$( date +'%T' ) Compiling $sourcefile ... "

    ./amxxpc $sourcefile -o/home/builder/builds/$outfile
done
