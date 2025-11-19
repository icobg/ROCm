#!/bin/bash

git clone https://github.com/Tencent/rapidjson

cd rapidjson
  git checkout master
  VERSION="git_$(git log --format="%ad_%h" --date=short | head -n 1 | tr -d -)"
  LONGDATE="$(git log -1 --format=%cd --date=format:%c )"
cd ..

mv rapidjson rapidjson-$VERSION

tar --exclude-vcs -cf rapidjson-$VERSION.tar rapidjson-$VERSION
plzip -9 -v rapidjson-$VERSION.tar
touch -d "$LONGDATE" rapidjson-$VERSION.tar.lz

rm -rf rapidjson-$VERSION
