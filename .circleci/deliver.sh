#!/bin/sh

#Die if we have to
set -e

GITREPO=`git remote get-url  origin | sed  s/'.*github.com[\/:]//' | sed s/.git//`
SCRIPTDIR=`dirname $0`

git config user.name "Circle CI by @Lakruzz"
git config user.email "circleci@lakruzz.com"
#git config --global push.default simple
`git remote add ghtoken https://$GHTOKEN@github.com/$GITREPO.git`

$SCRIPTDIR/integrate.sh

echo Delivering to GitHub
echo $ git push ghtoken
[ ! -z "$DRYRUN" ] ||  git push ghtoken


if [ ! -z "$CIRCLE_BRANCH" ]
then
  echo Delete the branch that was just integrated
  echo $ git push ghtoken :$CIRCLE_BRANCH
  git push ghtoken :$CIRCLE_BRANCH
fi
