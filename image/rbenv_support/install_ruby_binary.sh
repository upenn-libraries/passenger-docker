#!/bin/bash
set -e
source /pd_build/buildconfig

echo "+ Installing binary ruby with ruby_install_method = $ruby_install_method"

if [ "$ruby_install_method" == "rvm-binary" ]
then
    # use binary from rvm, but without rvm itself
    cd /opt
    curl https://rvm.io/binaries/ubuntu/16.04/x86_64/ruby-2.3.3.tar.bz2 | tar xj
fi

if [ "$ruby_install_method" == "ruby-build" ]
then
   # suggested build environment, from https://github.com/rbenv/ruby-build/wiki
   apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

   git clone https://github.com/rbenv/ruby-build.git /tmp/ruby-build

   CONFIGURE_OPTS="--disable-install-rdoc" /tmp/ruby-build/bin/ruby-build -v 2.3.3 /opt/ruby-2.3.3
fi
