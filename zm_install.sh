#!/bin/sh

clear
read -p "This script installs the latest Zoneminder from the PPA for Ubuntu 16.04...Press Enter to continue or Ctrl + c to quit" nothing
clear
read -p "Next enter your user password after pressing enter to continue" nothing

sudo apt-get update

sudo apt-get -y install mariadb-server mariadb-client apache2 php7.0 libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache  php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext php-apcu

clear
read -p "Next secure mariadb server by entering requested information. Press enter to continue" nothing
sudo mysql_secure_installation

read -p "Next we will add the PPA repository. Press enter to continue" nothing

sudo add-apt-repository ppa:iconnor/zoneminder

sudo apt-get update

sudo apt-get -y install zoneminder php-gd

sudo chmod 740 /etc/zm/zm.conf

sudo chown root:www-data /etc/zm/zm.conf

sudo adduser www-data video

sudo a2enmod cgi

sudo a2enconf zoneminder

sudo a2enmod rewrite

sudo chown -R www-data:www-data /usr/share/zoneminder/

sudo systemctl enable zoneminder

sudo service zoneminder start

clear
read -p "Next we will add timezone yo PHP. Nano will open, search for :date.timezone = and make it look like date.timezone = America/New_York Press enter to continue" nothing

sudo nano /etc/php/7.0/apache2/php.ini

sudo service apache2 reload

clear

read -p "Open Zoneminder in a web browser (http://server-ip/zm). Click on Options - Paths and change PATH_ZMS to /zm/cgi-bin/nph-zms Click the Save button. Press enter to continue" nothing
clear
read -p " if you plan to use the API go to https://wiki.zoneminder.com/Ubuntu_Server_16.04_64-bit_with_Zoneminder_1.30.0_the_easy_way and follow the instructions for the API fix. Press Enter to finish." nothing

