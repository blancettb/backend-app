#!bin/bash

cd /tmp

stress-ng -c 16 

echo "$delivery-instana-io-release-project-artifact-read-writer-creds" > tmp.txt

#non stress
#tail -f /dev/null
