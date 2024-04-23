#!/bin/bash

# Rollback code in concourse build 
build_num=`fly -t playground rerun-build --job build-and-push-image/build-and-push -b 53  | cut -d " " -f 3`
build_num=`echo "${build_num//#}"`
echo $build_num

build_status=`fly -t playground builds -c 20000 | grep build-and-push-image/build-and-push/"${build_num}" | cut -d " " -f 3`
echo $build_status

while [[ "$build_status" != "succeeded" ]] && [[ "$build_status" != "failed" ]] && [[ "$build_status" != "errored" ]]
do 
  build_status=`fly -t playground builds -c 20000 | grep build-and-push-image/build-and-push/"${build_num}"`
  arr=($build_status)
  echo "Build is in state: ${arr[2]}"
  build_status=`echo ${arr[2]}`
done

# Use Image pull policy to get the latest build pod
oc delete pod  -l app=backend-app -n customer-backend

