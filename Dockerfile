FROM ubuntu:14.04
MAINTAINER Fabian Stäber, fabian@fstab.de

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get -y install nodejs vim git
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get -y install npm
RUN npm -y install bower -g
RUN adduser --disabled-login --gecos '' bower
EXPOSE 8000
USER bower
WORKDIR /home/bower
ADD entrypoint.sh /home/bower/entrypoint.sh
ENTRYPOINT ["/home/bower/entrypoint.sh"]
