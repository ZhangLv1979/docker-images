#!/bin/sh

docker build -t docker-registry-default.app.eazytec.intra/eazytec/nginx:latest .
docker push docker-registry-default.app.eazytec.intra/eazytec/nginx:latest