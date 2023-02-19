#!/bin/bash -x
#!/usr/bin/expect

exec > >(tee /var/log/userdata.log) 2>&1

sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo yum install -y git
sudo yum install -y expect

sudo systemctl start httpd
sudo systemctl enable httpd

sudo systemctl is-enabled httpd
sudo usermod -a -G ${group} ${username}

sudo chown -R ${username}:${group} /var/www/*
sudo chmod 2775 /var/www && find /var/www/* -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

sudo yum install php-mbstring php-xml -y
sudo systemctl restart httpd
sudo systemctl restart php-fpm

cd /var/www/html
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
mkdir phpMyAdmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin --strip-components 1

rm phpMyAdmin-latest-all-languages.tar.gz
sudo systemctl start mariadb

sudo su - ec2-user
git clone ${Repository}
cp -r login-signup-form/* /var/www/html

spawn sudo mysql_secure_installation
        expect "Enter current password for root (enter for none): "
        send "\r"

        expect "Set root password? "
        send "y\r"

        expect "New password: "
        send "{db_password}\r"

        expect "Re-enter new password: "
        send "{db_password}\r"

        expect "Remove anonymous users? "
        send "y\r"

        expect "Disallow root login remotely? "
        send "y\r"

        expect "Remove test database and access to it? "
        send "y\r"

        expect "Reload privilege tables now? "
        send "y\r"
expect eof


mysql -u "root" "-p${db_password}" < "filename.sql"

cat << EOF > filename.sql
create database demo;
use demo;
CREATE TABLE IF NOT EXISTS `users` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `username` varchar(50) NOT NULL,
 `email` varchar(50) NOT NULL,
 `password` varchar(50) NOT NULL,
 `trn_date` datetime NOT NULL,
 PRIMARY KEY (`id`)
 );
EOF


