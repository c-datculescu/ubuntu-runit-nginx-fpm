#!/bin/bash

set -ex

LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

apt-get update

apt-get install --no-install-recommends -yqq php7.1-fpm

mkdir /run/php/