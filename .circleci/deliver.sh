#!/bin/sh

#Die if we have to
set -e

GITREPO=`git remote get-url  origin | sed  s/'.*github.com[\/:]//' | sed s/.git//`
SCRIPTDIR=`dirname $0`

git config user.name "Circle CI by @Lakruzz"
git config user.email "circleci@lakruzz.com"
#git config --global push.default simple
`git remote add ghtoken https://$GHTOKEN@github.com/$GITREPO.git`

exit

$SCRIPTDIR/integrate.sh

echo $ git push
[ ! -z "$DRYRUN" ] ||  git push ghtoken
git rev-parse --short HEAD
