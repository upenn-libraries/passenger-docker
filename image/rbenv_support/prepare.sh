#!/bin/bash
#
# based off ruby_support/prepare.sh and trimmed down

set -e
source /pd_build/buildconfig

echo "+ Updating /etc/gemrc"
echo "gem: --no-document" > /etc/gemrc

## Install fake DPKG entry so that Passenger doesn't install Ruby from APT.
echo "+ In /tmp:"
cd /tmp
run mkdir -p ruby-fake/DEBIAN
run cp /pd_build/ruby_support/dpkg-control ruby-fake/DEBIAN/control
run dpkg-deb -b ruby-fake .
run dpkg -i ruby-fake_1.0.0_all.deb
