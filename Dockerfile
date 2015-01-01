FROM nginx
MAINTAINER H.Y. Leung <hy.leung@gmail.com>

RUN apt-get -yqq update
RUN apt-get -yqq install wget

RUN mkdir -p /var/www
WORKDIR /var/www
RUN wget http://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-beta3.tar.gz -O kibana.tar.gz
RUN tar -xzvf kibana.tar.gz
RUN mv kibana-4.0.0-beta3 kibana
RUN rm kibana.tar.gz 

VOLUME /var/www/kibana

ADD files/kibana.yml /var/www/kibana/config/kibana.yml
