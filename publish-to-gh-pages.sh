#!/bin/bash
set -ev
git clone https://${GH_REF} .deploy_git
cd .deploy_git
git checkout master
cd ../
mv .deploy_git/.git/ ./public/
cd ./public
git config user.name  "hadronw"
git config user.email "hadronw@qq.com" 
# add commit timestamp
git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"
git push --force --quiet "https://${Travis_gh_token}@${GH_REF}" master:master
git push --force --quiet "https://hadronw:${Travis_co_token}@${CO_REF}" master:master
git push --force --quiet "https://${Travis_gitlab_token}@${GL_REE}" master:master
git push --force --quiet "https://gitlab-ci-token:${Travis_gitlab_token}@${GL_REE}" master:master
git push --force --quiet "https://oauth2:${Travis_gitlab_token}@${GL_REE}" master:master


