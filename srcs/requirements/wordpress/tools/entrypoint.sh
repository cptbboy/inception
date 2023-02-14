#!/bin/sh

# downloading && extracting wordpress
wget -P /var/www/html/ http://wordpress.org/latest.tar.gz
tar -xzf /var/www/html/latest.tar.gz -C /var/www/html/
rm /var/www/html/latest.tar.gz

# configuring php-fpm
sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php8/php-fpm.d/www.conf
sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php8/php-fpm.conf
sed -i 's/;error_log = log\/php8\/error.log/error_log = \/var\/www\/html\/wordpress_error.log/g' /etc/php8/php-fpm.conf

exec "$@"
