#!/bin/sh

# List all directories in the PATH
for dir in `echo $PATH | sed 's/:/ /g'`
do
  echo $dir
  ls -l $dir | nl
done | less

