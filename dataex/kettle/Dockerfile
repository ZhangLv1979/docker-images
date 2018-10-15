FROM busybox:glibc AS kettle-base

LABEL maintainer="Zhang Lv<zhanglv@eazytec.com>"

RUN apk add --no-cache libwebkitgtk-1.0.0 unzip --repository https://mirrors.aliyun.com/alpine/v3.8/main && \
    mkdir /approot && \ 
    curl -O -z /approot/kettle.zip https://sourceforge.net/projects/pentaho/files/Pentaho%208.1/client-tools/pdi-ce-8.1.0.0-365.zip/download && \
    curl https://sourceforge.net/projects/pentaho/files/Pentaho%208.1/shims/pentaho-hadoop-shims-hdp26-package-8.1.2018.05.00-365-dist.zip/download && \
    curl https://sourceforge.net/projects/pentaho/files/Pentaho%208.1/client-tools/pentaho-big-data-plugin-8.1.0.0-365.zip/download && \    
    unzip -n /approot/kettle.zip -d /approot

ADD * /approot

ENTRYPOINT [ "/approot/entrypoint.sh" ]