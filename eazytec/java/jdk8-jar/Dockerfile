# eazytec/jdk:8-alpine
ARG jarname="echo.jar"
FROM openjdk:8-jdk-alpine

LABEL maintainer="zhanglv@eazytec.com"

ENV JVM_ARGS="" \
    HOME="/opt/eazytec" \
    PATH="${PATH}:${HOME}"

RUN mkdir -p ${HOME} && \
    addgroup -g 1000 eazytec && \
    adduser -D -u 1000 -h ${HOME} -G eazytec eazytec 

WORKDIR ${HOME}

ONBUILD COPY . .

RUN chown -R eazytec:eazytec ${HOME} && \ 
    chmod -R 777 ${HOME}

EXPOSE 8080

USER eazytec

ENTRYPOINT ["./entrypoint.sh"]