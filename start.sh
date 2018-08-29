#!/bin/bash
set -e
gem install puppet -v ${PUPPET_VERSION:-5.5.6}
if [ $1 == "validate" ]; then
	cd manifests/ && find -name '*.pp' | xargs -n 1 -t puppet parser validate
elif [ $1 == "lint" ]; then
 	cd manifests/ && find -name '*.pp' | xargs -n 1 -t puppet-lint $OPTIONS
else
	echo "please use validate or lint"
fi