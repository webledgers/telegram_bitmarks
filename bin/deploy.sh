#!/bin/bash

DEFAULT_MESSAGE="webledger"
MESSAGE="${1:-DEFAULT_MESSAGE}"

git pull origin gh-pages
git add .
git commit -m "$MESSAGE"
git push origin gh-pages

# run twice in case new tx is not there
git mark
git mark

# TODO
# run tx
# add commit
# push