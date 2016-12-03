#!/bin/bash
set -e
source /pd_build/buildconfig

# use binary from rvm, but without rvm itself

cd /opt
curl https://rvm.io/binaries/ubuntu/16.04/x86_64/ruby-2.3.3.tar.bz2 | tar xj
