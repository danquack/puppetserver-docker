#!/bin/bash
set -e
if [ $1 == "validate" ]; then
	cd manifests/ && find -name '*.pp' | xargs -n 1 -t puppet parser validate
elif [ $1 == "lint" ]; then
 	cd manifests/ && find -name '*.pp' | xargs -n 1 -t puppet-lint $OPTIONS
elif [ $1 == "version" ]; then
 	puppet --version
else
	echo "please use validate, lint, or version"
fi