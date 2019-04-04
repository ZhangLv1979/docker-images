FROM nginx

LABEL maintainer="zhanglv <zhanglv@eazytec.com>"

RUN rm /etc/nginx/conf.d/default.conf

RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html/

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD default.conf /etc/nginx/conf.d/

EXPOSE 8443

CMD ["nginx", "-g", "daemon off;"]
