FROM node:10-slim

LABEL MAINTAINER="Zhang Lv <zhanglv@eazytec.com>"

ARG VERSION=3.2.3

LABEL version=$VERSION

RUN npm config set registry=https://registry.npm.taobao.org &&\
    npm install --global gitbook-cli &&\
	gitbook fetch ${VERSION} &&\
	npm cache clear --force &&\
	rm -rf /tmp/*

WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve