#!/bin/sh

# mysql -e "SHOW DATABASES;"

set -x

echo "[i] Cleaning MariaDB"
mysql -e "DROP DATABASE IF EXISTS test"
mysql -e "DROP USER ''@'localhost'"
mysql -e "DROP USER ''@'$(hostname)'"

echo "[i] Create wordpress database"
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB"

echo "[i] Create user '$MYSQL_USER' and grant all privileges on $MYSQL_DB"
mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@localhost;"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';"

# echo "[i] Create user 'alex'"
# mysql -e "CREATE USER 'alex'@localhost IDENTIFIED BY 'password';"

# mysql -e "SHOW DATABASES;"
# mysql -e "SELECT user FROM mysql.user;"

echo "[i] Add password to root"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
