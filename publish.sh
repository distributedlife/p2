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

# Clear out the entire gh-pages repo for replacement
rm -rf *

# Dump in the exported html
mv ../converted-html/* .

git add .
git commit -m "$1"

echo "Pushing changes to gh-pages ($1)"
git push origin gh-pages

git checkout "source"
