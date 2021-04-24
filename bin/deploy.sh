#!/bin/bash

DEFAULT_MESSAGE="webledger"
MESSAGE="${1:-DEFAULT_MESSAGE}"

git add .
git commit -m "$MESSAGE"
git push origin gh-pages

git mark

