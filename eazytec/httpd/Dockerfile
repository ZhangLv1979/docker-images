FROM httpd:alpine

LABEL maintainer="zhanglv@eazytec.com"

RUN mkdir -p /opt/eazytec && \
    addgroup -g 1000 eazytec && \
    adduser -D -u 1000 -h /opt/eazytec -G eazytec eazytec && \
    chmod 777 /opt/eazytec

# change listen port to 8080 to avoid permission issue, also set server name manual to avoid automethod fail.
COPY ./httpd.conf /usr/local/apache2/conf/

# allow user to run with root temporary, disabled, probably not needed.
RUN chown -R eazytec:eazytec /usr/local/apache2 && \
    chmod -R 777 /usr/local/apache2 && \
    chmod +x /usr/local/apache2/bin/httpd && \
    chmod +x /usr/local/bin/httpd-foreground

USER eazytec

EXPOSE 8080
