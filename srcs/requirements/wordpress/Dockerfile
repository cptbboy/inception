FROM alpine:3.16
RUN apk update && apk upgrade && apk add \
php8-fpm \
php8-common \
php8-session \
php8-iconv \
php8-json \
php8-gd \
php8-curl \
php8-xml \
php8-mysqli \
php8-imap \
php8-cgi \
fcgi \
php8-pdo \
php8-pdo_mysql \
php8-soap \
#php8-xmlrpc \
php8-posix \
#php8-mcrypt \
php8-gettext \
php8-ldap \
php8-ctype \
php8-dom \
php8-simplexml				
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php
CMD ["/usr/sbin/php-fpm8"]
