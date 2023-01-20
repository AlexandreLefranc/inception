FROM alpine:3.17.0

RUN apk update
RUN apk add \
  php81 \
  php81-fpm \
  php81-mysqli \
  php81-json \
  php81-openssl \
  php81-curl \
  php81-zlib \
  php81-xml \
  php81-phar \
  php81-intl \
  php81-dom \
  php81-xmlreader \
  php81-xmlwriter \
  php81-exif \
  php81-fileinfo \
  php81-sodium \
  php81-gd \
  php81-simplexml \
  php81-ctype \
  php81-mbstring \
  php81-zip \
  php81-opcache \
  php81-iconv \
  php81-pecl-imagick \
  mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./script/run.sh /root/run.sh

WORKDIR /var/www/wordpress

ENTRYPOINT ["/root/run.sh"]

CMD ["php-fpm81", "--nodaemonize"]