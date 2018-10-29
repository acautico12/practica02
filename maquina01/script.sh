#!/bin/bash
#Actualizacion de repositiorios
apt update
apt upgrade -y
#Instalacion de Apache2
apt install -y apache2

#Instalacion de la utilidad debconf
apt-get -y install debconf-utils

DB_ROOT_PASSWD=123456
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"

#Instalacion de mysqlserver
apt install -y mysql-server
apt install -y php libapache2-mod-php php-mysql
mkdir /var/www/html/prueba
cp /vagrant/index.php /var/www/html/prueba/

#Instalacion de git
apt install -y git

#Copia del repositorio de github
cd /tmp
git clone https://github.com/josejuansanchez/iaw-practica-lamp.git

#Ejecuto script
cd iaw-practica-lamp/db
mysql -u root -p$DB_ROOT_PASSWD < database.sql

#Copio los archivos de iaw-practica-lamp
rm /var/www/html/index.html
cp /tmp/iaw-practica-lamp/src/. /var/www/html/ -R
chown www-data:www-data /var/www/html/* -R
