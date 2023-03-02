#!/bin/sh

sed -i '/\[mariadb\]/a log_error=/var/lib/mysql/mariadb_error.log' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a log_warnings=4' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a user=mysql' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a mysqld.sock=\/var\/run\/mysqld\/mysqld.sock' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a port=3306' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a basedir=/usr' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a datadir=/var/lib/mysql' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a bind-address=0.0.0.0' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/skip-networking/skip-networking=0/g' /etc/my.cnf.d/mariadb-server.cnf
sed -i '/\[mariadb\]/a skip-bind-address' /etc/my.cnf.d/mariadb-server.cnf
chown -R mysql:mysql /var/lib/mysql
mkdir -p /auth_pam_tool_dir/auth_pam_tool
mysql_install_db > /dev/null
mariadbd-safe & sleep 1 > /dev/null \
	&& mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY $MARIADB_ROOT_PASSWORD;" \
	&& mysql -u root -e "DROP DATABASE IF EXISTS test;" \
	&& mysql -u root -e "DROP USER IF EXISTS ''@'%';" \
	&& mysql -u root -e "FLUSH PRIVILEGES;" \
	&& mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" \
    && mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" \
	&& mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;" \
	&& mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password $MARIADB_ROOT_PASSWORD shutdown

exec "$@"
