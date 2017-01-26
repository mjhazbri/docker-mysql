#!/bin/bash
# This script starts the database server.
StartMySQL ()
{
	echo ".......................... () Starting MySQL ....................................................."
    /usr/bin/mysqld_safe &
    sleep 5
}

CreateMySQLUser()
{
    echo ".......................... () Creating MySQL user ${MYSQL_USER} with ${MYSQL_PASSWORD} password ................"
    mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION"
    echo "=> Done!"
    echo "========================================================================"
    echo "You can now connect to this MySQL Server using:"
    echo ""
    echo "    mysql -u$MYSQL_USER -p$PASS -h<host> -P<port>"
    echo ""
    echo "Please remember to change the above password as soon as possible!"
    echo "MySQL user 'root' has no password but only allows local connections"
    echo "========================================================================"
}

OnCreateDB()
{    
        echo ".......................... () Creating MySQL databases............................................"
        mysql -uroot -e "CREATE DATABASE  IF NOT EXISTS ${MYSQL_DATABASE} DEFAULT CHARSET=utf8;"
}

StartMySQL
CreateMySQLUser
OnCreateDB
# And we restart the server to go operational
mysqladmin shutdown
echo "Starting MySQL Server"
/usr/sbin/mysqld
