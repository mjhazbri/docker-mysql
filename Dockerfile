FROM ubuntu:trusty
MAINTAINER Jalel Hazbri "jalel.hazbri@gmail.com"

ENV MYSQL_USER=mjhazbri
ENV MYSQL_PASSWORD=mjhazbri
ENV MYSQL_DATABASE=mjhazbri

# Install packages: mysql adds a root user with no password
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -yq install mysql-server && \
  rm -rf /var/lib/apt/lists/*

# Change mysql config
ADD my.cnf /etc/mysql/my.cnf

# setup our entry point
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

#ENTRYPOINT ["/run.sh"]

EXPOSE 3306
CMD ["/run.sh"]