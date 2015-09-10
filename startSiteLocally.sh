#!/bin/bash

# Install all ruby deps
bundle install

# Start the blog locally
bundle exec jekyll serve
