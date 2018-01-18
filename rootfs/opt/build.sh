#!/bin/bash

set -ex

LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

apt-get update

apt-get install --no-install-recommends -yqq php${PHP_MINOR_VERSION}-fpm

ln -s /usr/sbin/php-fpm${HPP_MINOR_VERSION} /usr/sbin/php-fpm

mkdir /run/php/
