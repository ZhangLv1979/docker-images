FROM node:8

RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/angular/angular && \
    cd angular && \
    git checkout -b 7 7.2.14 && \
    cd aio && \
    yarn && \
    yarn setup && \
    yarn build

CMD [ "yarn http-server dist -p 4200" ]
