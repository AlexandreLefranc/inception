FROM alpine:3.17.0

RUN apk update && \
    apk add mariadb mariadb-client

COPY ./conf/mariadb-server.cnf /etc/my.cnf

COPY ./script/setup_sql.sh /root/setup_sql.sh

COPY ./script/run.sh /root/run.sh

ENTRYPOINT ["/root/run.sh"]

CMD ["mysqld_safe"]
