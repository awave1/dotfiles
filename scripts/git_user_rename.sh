#!/usr/bin/env bash

old_email=$0
correct_name=$1
correct_email=$1

git filter-branch --env-filter `
OLD_EMAIL="$old_email"
CORRECT_NAME="$correct_name"
CORRECT_EMAIL="$correct_email"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
  export GIT_COMMITTER_NAME="$CORRECT_NAME"
  export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
  export GIT_AUTHOR_NAME="$CORRECT_NAME"
  export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
` --tag-name-filter cat -- --branches --tags
