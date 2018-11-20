FROM tomcat:7-alpine

LABEL maintainer="zhanglv@eazytec.com"

RUN mkdir -p /opt/eazytec && \
    addgroup -g 1000 eazytec && \
    adduser -D -u 1000 -h /opt/eazytec -G eazytec eazytec && \
    chmod 777 /opt/eazytec

COPY ./tomcat-users.xml ${CATALINA_HOME}/conf/

# allow user to run with root temporary, disabled, probably not needed.
RUN chown -R eazytec:eazytec ${CATALINA_HOME} && \
    chmod -R 777 ${CATALINA_HOME}

USER eazytec