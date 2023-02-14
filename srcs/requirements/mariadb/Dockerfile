FROM alpine:3.16
RUN apk update && apk upgrade && apk add mariadb mariadb-client
RUN chown -R mysql:mysql /var/lib/mysql
RUN sed -i '/\[mariadb\]/a user=mysql' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i '/\[mariadb\]/a mysqld.sock=\/var\/run\/mysqld\/mysqld.sock' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i '/\[mariadb\]/a port=3306' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i '/\[mariadb\]/a basedir=/usr' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i '/\[mariadb\]/a datadir=/var/lib/mysql' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i '/\[mariadb\]/a bind-address=0.0.0.0' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i '/\[mariadb\]/a log_error=\/var\/lib\/mysql\/mariadb_error.log' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i 's/skip-networking/skip-networking=0/g' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i '/\[mariadb\]/a skip-bind-address' /etc/my.cnf.d/mariadb-server.cnf
#        --auth-root-authentication-method=normal
#COPY ./tools/database_config.txt /tmp/database_config.txt
#RUN mariadbd-safe &
#RUN mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;"
#RUN mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
#RUN mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;"
#RUN mysql -u root -e "DROP USER ''@'%';"
#RUN mysql -u root -e "FLUSH PRIVILEGES;"
#RUN mysqladmin -u root password $MARIADB_ROOT_PASSWORD
#RUN mysqladmin -u root --password $MARIADB_ROOT_PASSWORD shutdown
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mariadbd-safe"]
#CMD ["tail", "-f"]
