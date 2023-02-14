#!/bin/sh
sed -i '/\[mariadb\]/a log_error=/var/lib/mysql/mariadb_error.log' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a log_warnings=4' /etc/my.cnf.d/mariadb-server.cnf
mkdir -p /auth_pam_tool_dir/auth_pam_tool
mysql_install_db \
        --user=mysql \
        --datadir=/var/lib/mysql \
        --basedir=/usr
mariadbd-safe \
        --user=mysql \
        --datadir=/var/lib/mysql & sleep 2 \
        && mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" \
        && mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" \
        && mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;" \
        && mysql -u root -e "DROP USER ''@'%';" \
        && mysql -u root -e "FLUSH PRIVILEGES;" \
        && mysqladmin -u root password $MARIADB_ROOT_PASSWORD
mysqladmin -u root password $MARIADB_ROOT_PASSWORD shutdown
exec "$@"

# mysql -u root -e "CREATE DATABASE IF NOT EXISTS asgard;"
# mysql -u root -e "CREATE USER IF NOT EXISTS 'rsiebert'@'%' IDENTIFIED BY 'fortytwo';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON asgard.* TO 'rsiebert'@'%' WITH GRANT OPTION;"
# mysql -u root -e "DROP USER ''@'%';"
# mysql -u root -e "FLUSH PRIVILEGES;"
# mysqladmin -u root password mjoelnir
