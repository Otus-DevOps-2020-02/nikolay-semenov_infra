#!/bin/bash

if which ruby ; then
  echo "Ruby already install"
else
  sudo apt update |
  sudo apt install -y \
    ruby-full \
    ruby-bundler \
    build-essential
fi
