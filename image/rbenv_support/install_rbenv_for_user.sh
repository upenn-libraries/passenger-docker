#!/bin/bash
# This should be run by each user who needs to use Ruby

rbenv init

eval "$(rbenv init -)"

ln -s /opt/ruby-2.3.3 ~/.rbenv/versions/ruby-2.3.3

rbenv global ruby-2.3.3
