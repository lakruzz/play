#!/bin/sh

PWD=`pwd`
if ! REPOROOT=`git rev-parse --show-toplevel` || [ $PWD != $REPOROOT ]
then
  echo "Wrong working directory"
  echo "  PWD:      $PWD"
  echo "  REPOROOT: $REPOROOT"
  echo "  CD into the root of the repo before execution"
  exit 1
fi

if git status --porcelain | grep "??"
then
   echo "Worktree isn´t clean"
   echo "  Run \"git add\" followed by \"git commit\""
   echo "  Or run \"git clean -f\""
   exit 1
fi

if git status --porcelain | grep ["^A","^D","^M"]
then
  echo "Index is dirty"
  echo "  Run \"git commit\" or reset with \"git reset --hard\""
  exit 1
fi
