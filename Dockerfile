########################################################################
# Dockerfile automated Docker Hub build - base image for nginx latest
#
# Centos7
# Nginx
#
########################################################################
FROM centos:latest

MAINTAINER sKull99 <jefe99.jeb@gmail.com>

ENV UPDATE "2017-09-11"

## Import the Centos6 and add EPEL repo
RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6 \
	&& rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

## YUM
RUN yum -y install \
	vim \
	nginx

## DIRECTORYS
RUN mkdir -p /var/www/default.int

## ADD files documentroot
ADD default.int/index.html /var/www/default.int/index.html

## ADD conf nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf

## ADD Conf serverblock
ADD conf.d/default.int.conf /etc/nginx/conf.d/default.int.conf

## PORTS
EXPOSE 80

## CMD
CMD ["nginx", "-g", "daemon off;"]
