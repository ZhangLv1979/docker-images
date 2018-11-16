FROM openjdk:8-alpine

LABEL maintainer="Zhang Lv<zhanglv@eazytec.com>"

ENV PENTAHO_HOME=/approot
ENV KETTLE_HOME=${PENTAHO_HOME}/conf \
    KETTLE_REPO="\/approot\/repo" \
    CARTE_NAME=carte-server \
    CARTE_HOSTNAME=0.0.0.0\
    CARTE_PORT=8080 \
    CARTE_USER=cluster \
    CARTE_PASSWORD=cluster \
    CARTE_IS_MASTER=N \
    CARTE_REPORT_TO_MASTERS=Y \
    CARTE_MASTER_NAME=carte-master \
    CARTE_MASTER_HOSTNAME=0.0.0.0 \
    CARTE_MASTER_PORT=40000 \
    CARTE_MASTER_USER=cluster \
    CARTE_MASTER_PASSWORD=cluster \
    CARTE_MASTER_IS_MASTER=Y \
    CARTE_INCLUDE_MASTERS=N \
    PATH=${PENTAHO_HOME}/data-integration:$PATH

RUN mkdir -p ${PENTAHO_HOME} && \
    mkdir -p ${KETTLE_HOME} && \
    addgroup -g 1000 eazytec && \
    adduser -D -u 1000 -h ${PENTAHO_HOME} -G eazytec eazytec && \
    chmod 777 ${PENTAHO_HOME} && \
    rm /etc/apk/repositories && \
    apk add --no-cache unzip --repository https://mirrors.aliyun.com/alpine/v3.8/main

ADD . ${PENTAHO_HOME}

WORKDIR ${PENTAHO_HOME}

RUN unzip -q pdi-ce-8.1.0.0-365.zip -d . && \
    rm pdi-ce-8.1.0.0-365.zip && \
    mv lib/* ./data-integration/lib && \
    rm -rf lib && \
    mkdir ./data-integration/logs && \
    mkdir repo

RUN chown -R eazytec:eazytec ${PENTAHO_HOME} && \
    chmod -R 777 ${PENTAHO_HOME}

USER eazytec

ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["carte.sh", "../carte.config.xml"]