
# This is a fork!

This fork of [phusion/passenger-docker](https://github.com/phusion/passenger-docker)
builds a docker image with Ruby installed using rbenv instead of rvm.

# Status

This is experimental! Use at your own risk.

# How to build

On Linux, you should be able to run:

```
make build_ruby23 NAME=codeforkjeff/passenger VERSION=0.9.19-rbenv
```

This should build an image named `codeforkjeff/passenger-ruby23:0.9.19-rbenv`

For other platforms and/or more complete instructions, see the section
["Building the image yourself"](https://github.com/phusion/passenger-docker#building)
in the README of the original repository.

# Notes

`image/install.sh` has been changed to replace `image/ruby-2.3.1.sh` with
`image/ruby-2.3.3-rbenv.sh` which in turn calls scripts from `rbenv_support/`.

Stubs in `/usr/bin` for ruby, gem, bundle, etc are created to use the
shims in `~/.rbenv/shims/xxx`.
