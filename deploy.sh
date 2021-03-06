#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# Build the project.
#rm -rf public
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
#git subtree push --prefix=public git@github.com:spencerlyon2/hugo_gh_blog.git gh-pages

# http://blog.srackham.com/posts/porting-my-blog-with-hugo/
# https://gist.github.com/cobyism/4730490
git subtree push --prefix public origin gh-pages
