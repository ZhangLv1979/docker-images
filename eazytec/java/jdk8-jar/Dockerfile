# eazytec/jdk:8-alpine
FROM openjdk:8-jdk-alpine

LABEL maintainer="zhanglv@eazytec.com"

ENV JAR="echo.jar" \
    JVM_ARGS="" \
    HOME="/opt/eazytec"

RUN mkdir -p ${HOME} && \
    addgroup -g 1000 eazytec && \
    adduser -D -u 1000 -h ${HOME} -G eazytec eazytec && \
    chmod 777 ${HOME} && \
    export ${PATH}=${HOME}|${PATH}

USER eazytec

WORKDIR ${HOME}

COPY "." "."

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]