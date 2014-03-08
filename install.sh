#!/bin/bash

#https://github.com/piwikla/aws-nginx

#Update
apt-get update
apt-get upgrade
apt-get remove -y apache2 apache2-doc apache2-utils apache2.2-common apache2.2-bin apache2-mpm-prefork apache2-doc apache2-mpm-worker  

#Install unzip
apt-get install unzip

#Install Dependencies
apt-get install build-essential python-software-properties

#Install GeoIP
apt-get install geoip-bin geoip-database libgeoip-dev
pecl install geoip

#Install MySQL
apt-get install mysql-server mysql-client

#Install Nginx
apt-get install nginx

mkdir -p /home/piwik/public_html/piwik.la

cd /home/piwik/public_html/piwik.la

wget http://piwik.org/latest.zip && unzip latest.zip
cd piwik
mv * ../
cd ../
rm -rf piwik

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/piwik.la
ln -s /etc/nginx/sites-available/piwik.la /etc/nginx/sites-enabled
rm /etc/nginx/sites-enabled/default

#Install phpmyadmin
apt-get install phpmyadmin
sudo ln -s /usr/share/phpmyadmin/ /home/piwik/public_html/piwik.la

#Install PHP
apt-get install php5-fpm php5-mysql php5-gd php5-memcache php5-curl php5-dev php-pear php5-mysqlnd

#Update
apt-get update
apt-get upgrade

#restart
service nginx restart
service php5-fpm restart
service mysql restart



