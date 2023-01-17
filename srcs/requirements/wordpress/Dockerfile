FROM alpine:3.17.0

RUN apk update
RUN apk add php81-common php81-fpm php81-phar php81-curl mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

CMD ["php-fpm81", "--nodaemonize"]

# mysql -ualefranc -ppassword -h mariadb
# wp core download
# wp config create --dbname=wordpress --dbuser=alefranc --dbpass=password --dbhost=mariadb:3306