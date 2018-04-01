#!/bin/sh

#Die if we have to
set -e

# Tweak these, if your remote target branch isn't origin/master
REMOTEREPO=origin
TARGETBRANCH=master

REMOTEBRANCH=$REMOTEREPO/$TARGETBRANCH

VERSION=${CIRCLE_SHA1:=`git rev-parse HEAD`}
VER=`echo $VERSION | cut -c 1-7`
TARGETVER=`git rev-parse --short $REMOTEBRANCH`

echo "Summary of diffs against current version ($VER) and $REMOTEBRANCH ($TARGETVER):"
git --no-pager diff --minimal --dirstat=changes,lines,files,cumulative --summary $TARGETVER..$VER

if [ ! -z "$DRYRUN" ]
then
  echo Dry Run mode
fi

echo $ git rebase $REMOTEBRANCH
[ ! -z "$DRYRUN" ] ||  git rebase $REMOTEBRANCH
git rev-parse --short HEAD

echo $ git checkout $TARGETBRANCH
[ ! -z "$DRYRUN" ] ||  git checkout $TARGETBRANCH
git rev-parse --short HEAD

echo $ git pull $REMOTEREPO $TARGETBRANCH
[ ! -z "$DRYRUN" ] ||  git pull $REMOTEREPO $TARGETBRANCH
git rev-parse --short HEAD

echo $ git merge --ff-only $VER
[ ! -z "$DRYRUN" ] ||  git merge --ff-only $VER
git rev-parse --short HEAD
