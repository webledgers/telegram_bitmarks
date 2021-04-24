#!/bin/bash

TMPFILE="/tmp/gitmark.$$.txt"
DEFAULT_MESSAGE="webledger"
MESSAGE="${1:-$DEFAULT_MESSAGE}"
# set up btm as remote exe
BTMEXE="ssh ubuntu@157.90.144.229"


git pull origin gh-pages
git add .
git commit -m "$MESSAGE"

git log -1 --pretty=%s | grep '^gitmark '
if [ $? -eq 0 ]
then
  echo git marked already
  exit
fi

git push origin gh-pages

# run twice in case new tx is not there
git mark
sleep 1
git mark > "${TMPFILE}"

cat "${TMPFILE}"

TX=$( cat "${TMPFILE}" | tail -1 )

echo
echo "${TX}"

HASH=$(${BTMEXE} ${TX})
echo "git commit --allow-empty -m 'gitmark ${HASH}'"

# TODO
# add commit
# push