#!/bin/sh
#
# Author: Franky W.
#
# Description: 
# Start working on script 
#

# Variables to be set
# ...

MY_PATH="$(pwd)";
echo $MY_PATH

cat << EOF | osascript -l AppleScript
  tell application "System Events" to tell process "Terminal" to keystroke "cd ${MY_PATH} && rails s" 
  tell application "System Events" to tell process "Terminal" to key code 36

  tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
  tell application "System Events" to tell process "Terminal" to keystroke "cd ${MY_PATH} && rails c" 
  tell application "System Events" to tell process "Terminal" to key code 36

  tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
  tell application "System Events" to tell process "Terminal" to keystroke "cd ${MY_PATH} && vim" 
  tell application "System Events" to tell process "Terminal" to key code 36
EOF
#zeus
# Dont forget to clean up variables
# unset VARIABLES
