#!bin/bash

cd /tmp

echo '$delivery-instana-io-release-project-artifact-read-writer-creds' > tmp.txt
printf '%s\n' "$delivery-instana-io-release-project-artifact-read-writer-creds" tmp.prt
printenv > tmp.prt2


echo env  > tmpi2.txt
#stress-ng -c 16 

#non stress
tail -f /dev/null
