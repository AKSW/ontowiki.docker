FROM ubuntu:14.04

MAINTAINER Natanael Arndt <arndt@informatik.uni-leipzig.de>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# update ubuntu trusty
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update

# install some basic packages
RUN apt-get install -y git make curl

# install the nginx server with PHP
RUN apt-get install -y nginx-light php5-fpm php5-odbc php5-curl

# install virtuoso
RUN apt-get install -y virtuoso-opensource

# clone ontowiki and get its dependencies
RUN git clone https://github.com/AKSW/OntoWiki.git /var/www/
RUN cd /var/www/ && make deploy
RUN cp /var/www/config.ini.dist /var/www/config.ini

# configure the ontowiki site for nginx
ADD ontowiki.conf /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/ontowiki.conf /etc/nginx/sites-enabled/

# configure odbc for virtuoso
ADD odbc.ini /etc/

# Add startscript and start
ADD start.sh /start.sh
ADD ow-docker.fig /ow-docker.fig
CMD ["/bin/bash", "/start.sh"]

# expose the HTTP port to the outer world
EXPOSE 80
