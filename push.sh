#!/bin/sh

setup_git() {
  git config --global user.email "mmanoj6363@gmail.com"
  git config --global user.name "mmanoj3"
}

commit_website_files() {
  git checkout main
  git add . 
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GITHUB_TOKEN}@github.com/mmanoj3/testframe.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages  main
}

setup_git
commit_website_files
upload_files
