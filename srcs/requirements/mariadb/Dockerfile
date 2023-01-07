FROM alpine:3.17.0

RUN apk update && apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld
RUN chown mysql:mysql -R /run/mysqld

# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
# RUN chown mysql:mysql -R /var/lib/mysql

COPY ./scripts/run.sh /root/run.sh

CMD ["mysqld", "--user=mysql"]

