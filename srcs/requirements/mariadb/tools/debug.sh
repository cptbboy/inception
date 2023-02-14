#!/bin/sh
apk update && apk upgrade && apk add mariadb mariadb-client
chown -R mysql:mysql /var/lib/mysql
sed -i '/\[mariadb\]/a log_error=/var/lib/mysql/mariadb_error.log' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a log_warnings=4' /etc/my.cnf.d/mariadb-server.cnf
mkdir -p /auth_pam_tool_dir/auth_pam_tool
mysql_install_db \
        --user=mysql \
        --datadir=/var/lib/mysql \
        --basedir=/usr \
        --auth-root-authentication-method=normal
sleep 42
exec "$@"
