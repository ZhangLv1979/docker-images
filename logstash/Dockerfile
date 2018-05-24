FROM docker.elastic.co/logstash/logstash:6.2.4

ENV DB_HOST=postgres DB_PORT=5432 DB_NAME=bdex DB_USER=bdex DB_PASS=bdex123ASD
ENV ES_HOST=192.168.31.3 ES_PORT=9200
ENV POST_NAME=前置机

RUN mkdir -p /usr/share/logstash/plugins
RUN curl -k -o /usr/share/logstash/plugins/postgresql-42.2.2.jar https://jdbc.postgresql.org/download/postgresql-42.2.2.jar
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/