#!/bin/sh

#Die if we have to
set -e

SCRIPTDIR=`dirname $0`

$SCRIPTDIR/integrate.sh

echo $ git push
[ ! -z "$DRYRUN" ] ||  git push
git rev-parse --short HEAD
