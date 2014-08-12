FROM aksw/ontowiki-ubuntu-nginx

MAINTAINER Sebastian Tramp <tramp@informatik.uni-leipzig.de>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Add the updated startscript and start
ADD start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]

# expose the HTTP port to the outer world
EXPOSE 80
