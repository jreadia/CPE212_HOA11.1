FROM ubuntu:25.04 AS ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y nginx mariadb-server \
	&& apt-get clean
EXPOSE 80 3306
CMD service mysql start && service nginx start && tail -f /dev/null


FROM centos:9 AS centos
RUN dnf -y update \
	&& dnf -y install epel-release \
	&& dnf -y install nginx mariadb-server \
	&& dnf clean all
EXPOSE 80 3306
CMD ["/bin/bash", "-c", "systemctl start mariadb; systemctl start nginx; tail -f /dev/null"]


