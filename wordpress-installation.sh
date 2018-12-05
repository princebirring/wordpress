#Installing the Wordpress
sudo apt-get update -y && sudo apt-get upgrade -y
# Install Apache2 HTTP Server
sudo apt-get install apache2
# Install Apache2 HTTP Server
sudo apt-get install mariadb-server mariadb-client
# Install PHP 7.1 and Related Modules
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt-get install php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd
# Install Wordpress
wget https://Wordpress.org/latest.zip
sudo unzip -d /var/www/html latest.unzip
sudo chown -R www-data:www-data /var/www/html/*
sudo systemctl restart apache2.service
# Setting up Wordpress
# Creating an SSL Certificate to secure our web server
sudo mkdir /etc/apache2/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
# Activate our new SSL Certificate
sudo a2ensite default-ssl.conf
sudo service apache2 reload
sudo a2enmod ssl
sudo service apache2 restart
