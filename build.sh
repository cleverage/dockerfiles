#!/usr/bin/env bash

export BASE_PATH=./eav-manager/php7.2

#docker build \
#    --tag cleverage/eav-manager:php7.2 \
#    --file ${BASE_PATH}/Dockerfile \
#    ${BASE_PATH}/.

docker build \
    --tag cleverage/eav-manager:php7.2-dev \
    --file ${BASE_PATH}/Dockerfile.dev \
    ${BASE_PATH}/.
