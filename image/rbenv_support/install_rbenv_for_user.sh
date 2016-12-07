#!/bin/bash
# This should be run by each user who needs to use Ruby
set -e
source /pd_build/buildconfig

echo "+ Installing rbenv for user $USER"

eval "$(rbenv init -)"

ln -s /opt/ruby-2.3.3 ~/.rbenv/versions/ruby-2.3.3

rbenv global ruby-2.3.3
