FROM node:8.10.0-slim
MAINTAINER Shengyi

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Define en_US
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL = en_US.UTF-8
ENV LANG en_US.UTF-8

RUN set -ex \
    # && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5 \
    # && echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.6 main" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list
	&& apt-get -y update \
	# && apt-get install -y mongodb-org=3.6.3 mongodb-org-server=3.6.3 mongodb-org-shell=3.6.3 mongodb-org-mongos=3.6.3 mongodb-org-tools=3.6.3 \
	&& apt-get -y install git vim

ADD id_rsa /root/.ssh/

WORKDIR /root/

RUN set -ex \
	&& ssh-keyscan github.com >> /root/.ssh/known_hosts \
	&& git clone git@github.com:psyking841/SearchingSiteNodeJS.git \
	&& cd /root/SearchingSiteNodeJS/ \
	# Install dependencies
	&& npm install -g npm@latest \
	&& npm install

EXPOSE 7080
WORKDIR /root/SearchingSiteNodeJS/
CMD ["npm", "start"]
