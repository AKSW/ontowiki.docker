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

# configure virtuoso
ADD odbc.ini /etc/
ADD start.sh /start.sh

# start the virtuoso service
# virtuoso-t
#RUN service virtuoso-opensource-6.1 start
#CMD ["service", "virtuoso-opensource-6.1", "start"]
# start the php5-fpm service
#RUN service php5-fpm start
#CMD ["service", "php5-fpm", "start"]
# start the nginx service
#CMD ["service", "nginx", "start"]
#RUN service nginx start

CMD ["/bin/bash", "/start.sh"]

# expose the HTTP port to the outer world
EXPOSE 80
