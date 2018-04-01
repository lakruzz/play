#!/bin/sh

#Die if we have to
set -e

FILE=version.txt
VERSION=${CIRCLE_SHA1:=`git rev-parse HEAD`}
VER=`echo $VERSION | cut -c 1-7`
GITREPO=`git remote get-url  origin | sed  s/'.*github.com[\/:]//' | sed s/.git//`

echo "$VER of $GITREPO" > $FILE
echo "Wrote '$VER of $GITREPO' to $FILE"
