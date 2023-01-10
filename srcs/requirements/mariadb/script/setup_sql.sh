#!/bin/sh

# mysql -e "SHOW DATABASES;"

echo "[i] Cleaning MariaDB"
mysql -e "DROP DATABASE IF EXISTS test"
mysql -e "DROP USER ''@'localhost'"
mysql -e "DROP USER ''@'$(hostname)'"

echo "[i] Create wordpress database"
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress"

echo "[i] Create user 'alefranc' and grant all privileges on wordpress"
mysql -e "CREATE USER 'alefranc'@localhost IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'alefranc'@localhost;"

echo "[i] Create user 'alex'"
mysql -e "CREATE USER 'alex'@localhost IDENTIFIED BY 'password';"

# mysql -e "SHOW DATABASES;"
# mysql -e "SELECT user FROM mysql.user;"

echo "[i] Add password to root"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;"
