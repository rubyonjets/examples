#!/bin/bash

for i in examples/* ; do
  cd $i
  git checkout master
  git push origin master
  cd -
done
