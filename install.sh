#!/bin/bash

#https://github.com/piwikla/aws-nginx

#Update
add-apt-repository ppa:nginx/stable
add-apt-repository ppa:ondrej/php5
add-apt-repository ppa:nijel/phpmyadmin
apt-get update
apt-get upgrade

#Install unzip
apt-get install unzip

#Install Dependencies
apt-get install build-essential python-software-properties

#Install PHP
apt-get install php5 php5-cli php5-fpm php5-mysql php5-gd php5-memcache php5-curl php5-dev php-pear php5-mysqlnd

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

#Update
apt-get update
apt-get upgrade

#restart
service nginx restart
service php5-fpm restart
service mysql restart



