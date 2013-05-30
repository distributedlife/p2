#!/bin/bash

[ -z "$1" ] && echo "Please provide an update message for git commit (eg publish.sh \"Added new article.\")" && exit 1

# Does mixture_project/converted-html exist
[ ! -d mixture_project/converted-html ] && echo "Please export the site from Mixture before publishing." && exit 1

# Can we git checkout gh-pages
git checkout gh-pages
[ "$(echo $?)" != "0" ] && echo "Can't checkout gh-pages. Close Mixture and git checkout ." && exit 1

# Mv converted-html to ..
echo "Restructing, hold tight."
rm -rf ../converted-html
cp -R mixture_project/converted-html ..

# rm -rf *
rm -rf *

# Mv ../converted-html/* .
mv ../converted-html/* .

# Git add .
git add .

# Git commit -m "Updated"
git commit -m "$1"

echo "Pushing changes to gh-pages ($1)"
# Git push origin gh-pages
git push origin gh-pages

# Get back to the start.
git checkout "source"
