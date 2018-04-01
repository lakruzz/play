#!/bin/sh

#Die if we have to
set -e

./integrate.sh

echo $ git push
[ ! -z "$DRYRUN" ] ||  git push
git rev-parse --short HEAD
