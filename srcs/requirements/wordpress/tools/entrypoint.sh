#!/bin/sh

# downloading && extracting wordpress
wget -P /var/www/html/ http://wordpress.org/latest.tar.gz > /dev/null
tar -xzf /var/www/html/latest.tar.gz -C /var/www/html/
rm -f /var/www/html/wordpress/wp-config-sample.php

# configuring php-fpm
sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php8/php-fpm.d/www.conf
sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php8/php-fpm.conf
sed -i 's/;error_log = log\/php8\/error.log/error_log = \/var\/www\/html\/wordpress_error.log/g' /etc/php8/php-fpm.conf

# installing wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null
chmod +x wp-cli.phar
mv wp-cli.phar /bin/wp
wp core install	--allow-root \
		--path=/var/www/html/wordpress \
		--url=${DOMAIN} \
		--title=${WORDPRESS_TITLE} \
		--admin_user=${WORDPRESS_ROOT_USER} \
		--admin_password=${WORDPRESS_ROOT_PASSWORD} \
		--admin_email=${WORDPRESS_ROOT_MAIL}
wp user create	${WORDPRESS_USER} \
		${WORDPRESS_MAIL} \
		--user_pass=${WORDPRESS_PASSWORD} \
		--path=/var/www/html/wordpress \
		--allow-root

exec "$@"
