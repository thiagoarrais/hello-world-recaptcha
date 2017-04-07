#!/usr/bin/env bash

RACKUP_CONFIG=config.ru

WORK_DIR=$(cd "$(dirname "$0")"; pwd)
BUNDLE_GEMFILE=$WORK_DIR/Gemfile
BUNDLE_GEMFILE=$BUNDLE_GEMFILE bundle exec rackup -s thin -o $IP -p $PORT $WORK_DIR/$RACKUP_CONFIG
