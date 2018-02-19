FROM node:8.9.4-slim
MAINTAINER Shengyi

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Define en_US
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN set -ex \
	&& apt-get -y update \
	&& apt-get -y install git vim

ADD id_rsa /root/.ssh/

WORKDIR /root/

RUN set -ex \
	&& ssh-keyscan github.com >> /root/.ssh/known_hosts \
	&& git clone git@github.com:psyking841/SearchingSiteNodeJS.git \
	# Install dependencies
	&& cd /root/SearchingSiteNodeJS \
	&& npm install npm@latest -g. \
	&& npm install express \
	&& npm install serve-favicon \
	&& npm install morgan \
	&& npm install cookie-parser \
	&& npm install body-parser \
	&& npm install mongoose \
	&& npm install mongoose-map \
	&& npm install gridfs-stream \
	&& npm install debug \
	&& npm install jade

EXPOSE 7080
WORKDIR /root/SearchingSiteNodeJS/
CMD ["npm", "start"]
