#!/bin/sh

set -e

echo git rebase origin/master
git rebase origin/master

echo git checkout master
git checkout master

echo git pull
git pull

echo  git merge --ff-only $CIRCLE_BRANCH
git merge --ff-only $CIRCLE_BRANCH
