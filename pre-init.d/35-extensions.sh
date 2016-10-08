#!/bin/bash

sed -i "s|;date.timezone =.*|date.timezone = ${TZ}|" /etc/php5/php.ini
echo  "xdebug.remote_host=10.254.254.254" >> /etc/php5/conf.d/xdebug.ini
echo  "xdebug.idekey=INTELLIJ" >> /etc/php5/conf.d/xdebug.ini
echo  "xdebug.remote_autostart=1" >> /etc/php5/conf.d/xdebug.ini
echo  "xdebug.remote_enable=1" >> /etc/php5/conf.d/xdebug.ini
echo  "xdebug.remote_connect_back=0" >> /etc/php5/conf.d/xdebug.ini
echo  "xdebug.max_nesting_level=400" >> /etc/php5/conf.d/xdebug.ini