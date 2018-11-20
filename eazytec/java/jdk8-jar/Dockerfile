# eazytec/jdk:8-alpine
FROM openjdk:8-jdk-alpine

LABEL maintainer="zhanglv@eazytec.com"

ENV JAR "echo.jar"

RUN mkdir -p /opt/eazytec && \
    addgroup -g 1000 eazytec && \
    adduser -D -u 1000 -h /opt/eazytec -G eazytec eazytec && \
    chmod 777 /opt/eazytec

USER eazytec

COPY "${JAR}" "${JAR}"

EXPOSE 8080

CMD [ "java", "-jar", "${JAR}" ]