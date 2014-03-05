#!/bin/bash

#https://github.com/piwikla/aws-nginx

#Update
apt-get update
apt-get upgrade

#Install Dependencies
apt-get install build-essential python-software-properties

#Install PHP
apt-get install php5-fpm php5-gd php5-memcache memcached php5-curl php5-dev php-pear

#Install GeoIP
apt-get install geoip-bin geoip-database libgeoip-dev

#Install MySQL
apt-get install mysql-server mysql-client

#Basic Security
apt-get install fail2ban iptables-persistent

#Install Nginx
apt-get install nginx

#Update
apt-get update
apt-get upgrade

#Start Nginx
service nginx start
