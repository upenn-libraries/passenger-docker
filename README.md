
# This is a fork!

This fork of [phusion/passenger-docker](https://github.com/phusion/passenger-docker)
builds a docker image with Ruby installed using rbenv instead of rvm.

# Status

This has been tested for several months and has been in production use
without any problems. But use at your own risk.

# Docker Hub repository

Builds are available here:

https://hub.docker.com/r/pennlib/passenger-ruby23/

# How to build

On Linux, you should be able to run:

```
make build_ruby23 NAME=pennlib/passenger VERSION=0.9.23-ruby-build
```

This should build an image named `pennlib/passenger-ruby23:0.9.23-ruby-build`

You can set `RUBY_INSTALL_METHOD` to 'rvm-binary' to use a precompiled
ruby from rvm. (By default, the value is 'ruby-build' which builds from
source.) Example:

```
make build_ruby23 NAME=pennlib/passenger VERSION=0.9.23-rvm-binary RUBY_INSTALL_METHOD=rvm-binary
```

For other platforms and/or more complete instructions, see the section
["Building the image yourself"](https://github.com/phusion/passenger-docker#building)
in the README of the original repository.

# Pushing Images to Docker Hub

You will need a user account on Docker Hub, and you'll need to be
added to the pennlib organization account. Then follow
[these instructions](https://docs.docker.com/docker-cloud/builds/push-images/)
to login and push. If you built the images following the instructions
above, you should't need to do the 'tag' step, since it will already
have the correct image name.

# Notes

`image/install.sh` has been changed to replace `image/ruby-2.3.1.sh` with
`image/ruby-2.3.3-rbenv.sh` which in turn calls scripts from `rbenv_support/`.

Stubs in `/usr/bin` for ruby, gem, bundle, etc are created to use the
shims in `~/.rbenv/shims/xxx`.
