#!/bin/sh

# Create /run/mysqld directory
if [ -d "/run/mysqld" ]; then
	echo "[i] mysqld already present, skipping creation"
	chown -R mysql:mysql /run/mysqld
else
	echo "[i] mysqld not found, creating...."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

# Create DB if it does not exist
if [ -d /var/lib/mysql/mysql ]; then
	echo "[i] MySQL directory already present, skipping creation"
	chown -R mysql:mysql /var/lib/mysql
else
	echo "[i] MySQL data directory not found, creating initial DBs"

	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

    echo "    Starting mysqld_safe --skip-networking --nowatch"
    mysqld_safe --skip-networking --nowatch

	sleep 1

	sh /root/setup_sql.sh

    mysqladmin -uroot -ppassword shutdown
fi

exec "$@"