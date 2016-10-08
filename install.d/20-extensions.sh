#!/bin/bash

apk add --update alpine-sdk php5-dev autoconf zlib-dev pcre-dev

pecl_install ()
{
  local EXT_TYPE=$1
  local NAME=$2
  local VERSION=$3
  local CONFIGURE_ARGS=$(shift 3; echo $@)
  local PECL_URL="https://pecl.php.net/get/$NAME-$VERSION.tgz"

  cd /tmp
  curl $PECL_URL -O
  tar xzf $NAME-$VERSION.tgz
  cd /tmp/$NAME-$VERSION
  phpize
  ./configure $CONFIGURE_ARGS
  make
  make install
  echo "$EXT_TYPE=$NAME.so" >> /etc/php5/conf.d/$NAME.ini
}

# Install PHP extensions
pecl_install extension apcu 4.0.10 --enable-apcu
pecl_install zend_extension xdebug 2.3.3 --enable-xdebug

# Cleanup
rm -rf /tmp/*
apk del autoconf php5-dev zlib-dev pcre-dev alpine-sdk
rm -rf /var/cache/apk/*

apk -U add php5-iconv php5-intl php5-posix openrc sshd
curl -LsS https://symfony.com/installer -o /usr/bin/symfony
chmod +x /usr/bin/symfony

apk update && apk add ca-certificates && update-ca-certificates && apk add openssl
rc-update add sshd
wget https://phar.phpunit.de/phpunit-old.phar
chmod +x phpunit-old.phar
mv phpunit-old.phar /usr/local/bin/phpunit