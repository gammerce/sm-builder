#!/usr/bin/env bash

set -e

# Compile all sma files
for sourcefile in /home/builder/sources/*.sma; do
    outfile="$( basename "$sourcefile" .sma).amxx"
    echo "$( date +'%T' ) Compiling $sourcefile ... "
  
  	if [[ $1 == "test" ]]; then
  		if ./amxxpc -d0 $sourcefile -o/home/builder/builds/$outfile | grep -i "error"; then
			exit 1
		fi
  	else
  		./amxxpc -d2 $sourcefile -o/home/builder/builds/$outfile
  	fi
done

if [[ $1 == "watch" ]]; then
    /home/builder/watch.sh
fi
