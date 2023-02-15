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
curl \
php8-phar \
php8-simplexml > /dev/null
COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php
EXPOSE 9000
COPY ./tools/entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["/usr/sbin/php-fpm8"]
