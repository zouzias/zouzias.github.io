#!/bin/bash

# You need to install ruby `brew install ruby` and
# bundler `gem install bundler`

# Install all ruby deps
bundle install

# Start the blog locally
bundle exec jekyll serve
