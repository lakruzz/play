#!/bin/sh

echo  git merge --ff-only $CIRCLE_BRANCH
git merge --ff-only $CIRCLE_BRANCH
