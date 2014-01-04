#!/bin/bash
ps aux | grep '[z]eus slave: boot' > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
  clear; zeus test $@
else
  clear; bundle exec ruby -Itest $@
fi
