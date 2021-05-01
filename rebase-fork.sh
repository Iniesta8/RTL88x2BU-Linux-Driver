#!/usr/bin/env bash

set -e

git checkout master
git fetch upstream
git rebase upstream/master

