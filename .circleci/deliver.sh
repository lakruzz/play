#!/bin/sh

#Die if we have to
set -e

SCRIPTDIR=`dirname $0`
GITREPO=`git remote get-url  origin | sed  s/'.*github.com[\/:]//' | sed s/.git//`

git config user.name "Circle CI by @Lakruzz"
git config user.email "circleci@lakruzz.com"
git config --global push.default simple
echo git remote add ghtoken https://$(printenv GHTOKEN)@github.com/$(printenv GITREPO).git

$SCRIPTDIR/integrate.sh

echo $ git push
[ ! -z "$DRYRUN" ] ||  git push github
git rev-parse --short HEAD
