# docker-mysql
Install a mysql server, add a user with a password.

### BUILD :
docker build -t mysql_image .
### RUN :
docker run -p 3306:3306 --name container_mysql mysql_image