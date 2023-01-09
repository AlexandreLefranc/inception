FROM alpine:3.17.0

RUN apk update && \
    apk add mariadb mariadb-client

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY ./script/setup.sql /root/setup.sql

COPY ./script/run.sh /root/run.sh

ENTRYPOINT ["sh", "/root/run.sh"]

# CMD ["mysqld", "--user=mysql"]
# CMD ["tail", "-f"]

