# eazytec/jdk:oracle-8-alpine
FROM alpine

LABEL maintainer="zhanglv@eazytec.com"

ENV JAR="echo.jar" \
    JVM_ARGS="" \
    HOME="/opt/eazytec" \
    JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=201 \
    JAVA_VERSION_BUILD=09 \
    JAVA_PACKAGE=jdk \
    JAVA_HOME=/opt/jdk \
    PATH="${PATH}:${HOME}:${JAVA_HOME}/bin"

RUN apk --update add curl ca-certificates tar
# RUN apk --update add curl ca-certificates tar && \
#     curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk && \
#     apk add --allow-untrusted /tmp/glibc-2.21-r2.apk

RUN curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
  http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    | tar -xzf - -C /opt &&\
    ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk &&\
    rm -rf /opt/jdk/*src.zip \
           /opt/jdk/lib/missioncontrol \
           /opt/jdk/lib/visualvm \
           /opt/jdk/lib/*javafx* \
           /opt/jdk/jre/lib/plugin.jar \
           /opt/jdk/jre/lib/ext/jfxrt.jar \
           /opt/jdk/jre/bin/javaws \
           /opt/jdk/jre/lib/javaws.jar \
           /opt/jdk/jre/lib/desktop \
           /opt/jdk/jre/plugin \
           /opt/jdk/jre/lib/deploy* \
           /opt/jdk/jre/lib/*javafx* \
           /opt/jdk/jre/lib/*jfx* \
           /opt/jdk/jre/lib/amd64/libdecora_sse.so \
           /opt/jdk/jre/lib/amd64/libprism_*.so \
           /opt/jdk/jre/lib/amd64/libfxplugins.so \
           /opt/jdk/jre/lib/amd64/libglass.so \
           /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
           /opt/jdk/jre/lib/amd64/libjavafx*.so \
           /opt/jdk/jre/lib/amd64/libjfx*.so

RUN mkdir -p ${HOME} && \
    addgroup -g 1000 eazytec && \
    adduser -D -u 1000 -h ${HOME} -G eazytec eazytec 

WORKDIR ${HOME}

COPY "." "."

RUN chown -R eazytec:eazytec ${HOME} && \ 
    chmod -R 777 ${HOME}

EXPOSE 8080

USER eazytec

ENTRYPOINT ["./entrypoint.sh"]