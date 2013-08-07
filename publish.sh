#!/bin/bash
rake generate

[ -z "$1" ] && echo "Please provide an update message for git commit (eg publish.sh \"Added new article.\")" && exit 1

# Does mixture_project/converted-html exist
#[ ! -d mixture_project/converted-html ] && echo "Please export the site from Mixture before publishing." && exit 1

echo "Restructing, hold tight."
rm -rf ../public
rm -rf ../redirects
cp -R public ..
cp -R redirects ..

# Can we git checkout gh-pages
git checkout gh-pages
[ "$(echo $?)" != "0" ] && echo "Can't checkout gh-pages. Close Mixture and git checkout ." && exit 1
git pull --rebase

# Clear out the entire gh-pages repo for replacement
rm -rf *

# Dump in the exported html
mv ../public/p2/* .
cp -R ../redirects/* .

git add .
git add -u
git commit -m "$1"

echo "Pushing changes to gh-pages ($1)"
git push origin gh-pages
[ "$(echo $?)" != "0" ] && echo "Error pushing changes. We're going to stop here while you resolve it." && exit 1

git checkout "source"
