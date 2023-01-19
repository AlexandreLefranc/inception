#!/bin/sh

echo "Config PHP FPM"
sed -i 's|listen = 127.0.0.1:9000|listen = wordpress:9000|g' /etc/php81/php-fpm.d/www.conf

if [ -f /var/www/wordpress/wp-config.php ]; then
    echo "WordPress already configurated"
else
    echo "WordPress is not configured"
    echo ""

    echo "Downloading WordPress"
    wp core download
    
    echo "Configurating WordPress"
    wp config create\
        --dbname=wordpress\
        --dbuser=alefranc\
        --dbpass=password\
        --dbhost=mariadb:3306

    echo "Installing WordPress"
    wp core install\
        --url="alefranc.42.fr"\
        --title="Inception"\
        --admin_user="alefranc"\
        --admin_password="password"\
        --admin_email="alefranc@student.42.fr"

    echo "Need to create user ?"
fi

exec "$@"