#!/bin/bash

for i in examples/* ; do
  cd $i
  git checkout master
  git pull
  bundle update
  jets upgrade
  git add .
  git commit -m 'upgrade jets'
  cd -
done
