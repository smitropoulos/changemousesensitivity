#!/bin/bash

configFile="/tmp/mouseSensitivityFlag"
flag=`cat $configFile` 

mouseID=$(sudo xinput --list | grep 'Logitech MX Master 2S' | grep 'pointer' | awk '{print $7}' | awk -F'=' '{print $2}')

if [ $flag -eq 0 ]; then 
  echo "Chaning sensitivity to 0 on mouse $mouseID with flag $flag"
  xinput --set-prop $mouseID 'libinput Accel Speed' 1
  echo 1 > $configFile 
else
  echo "Chaning sensitivity to 1 on mouse $mouseID with flag $flag"
  xinput --set-prop $mouseID 'libinput Accel Speed' 0
  echo 0 > $configFile 
fi
