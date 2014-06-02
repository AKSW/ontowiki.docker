FROM ubuntu:14.04

MAINTAINER Natanael Arndt <arndt@informatik.uni-leipzig.de>

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git make curl
RUN apt-get install -y nginx-light php5-fpm php5-odbc php5-curl
RUN apt-get install -y virtuoso-minimal
RUN git clone https://github.com/AKSW/OntoWiki.git /var/www/
RUN cd /var/www/ && make deploy

ADD ontowiki.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/ontowiki.conf /etc/nginx/sites-enabled/

ENTRYPOINT["service", "nginx", "start"]
EXPOSE 80
