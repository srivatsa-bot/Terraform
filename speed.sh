#!/bin/bash

nohup microsoft-edge > /dev/null 2>&1 &
nohup microsoft-edge --new-window "https://www.youtube.com/watch?v=SPcwo0Gq9T8" >/dev/null 2>&1 &
nohup /opt/./cursor.appimage ~/golang-lco/Terraform/ > /dev/null 2>&1 &
echo "waiting for Tabs"
sleep 3
echo "Tabs are ready"
wmctrl -r "Microsoft Edge" -t 0
wmctrl -r "ashiCorp Terraform Associate Certification Course (003)" -t 1
wmctrl -r "Cursor" -t 2
echo "zoom"
