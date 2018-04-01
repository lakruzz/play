#!/bin/sh

set -e

echo git rebase origin/master
git rebase origin/master

echo git checkout master
git checkout master

echo git pull
git pull

git rev-parse --short HEAD

echo  git merge --ff-only $CIRCLE_SHA1
git merge --ff-only $CIRCLE_SHA1
