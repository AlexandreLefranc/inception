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
        --dbname=$MYSQL_DB\
        --dbuser=$MYSQL_USER\
        --dbpass=$MYSQL_PASSWORD\
        --dbhost=mariadb:3306

    echo "Installing WordPress"
    wp core install\
        --url="alefranc.42.fr"\
        --title="Inception"\
        --admin_user=$WP_USER\
        --admin_password=$WP_PASSWORD\
        --admin_email=$WP_EMAIL

    echo "Create unprivileged user"
    wp user create\
        bob\
        bob@student.42.fr\
        --user_pass="bob"

fi

exec "$@"