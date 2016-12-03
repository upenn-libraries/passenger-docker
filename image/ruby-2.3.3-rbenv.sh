#!/bin/bash
set -e
source /pd_build/buildconfig

header "Installing rbenv and ruby"

run /pd_build/rbenv_support/prepare.sh

run /pd_build/rbenv_support/install_ruby_binary.sh

run /pd_build/rbenv_support/install_rbenv.sh

run /pd_build/rbenv_support/install_rbenv_for_user.sh

run su app -c -l /pd_build/rbenv_support/install_rbenv_for_user.sh

# this installs libs that typical Ruby installations/gems will need
run /pd_build/ruby_support/install_ruby_utils.sh

# TODO: figure out where/how the ruby_support scripts install these
# packages. I'm just adding stuff here as things break.
run apt-get -y install libyaml-0-2 libgmp-dev

eval "$(rbenv init -)"
run gem install $DEFAULT_RUBY_GEMS
