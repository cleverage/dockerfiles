#!/bin/sh
set -e

export INIT_COMPOSER_INSTALL

export INIT_XDEBUG_ACTIVATED
export INIT_XDEBUG_REMOTE_HOST
export INIT_XDEBUG_REMOTE_PORT
export INIT_XDEBUG_IDEKEY

### INIT PROJECT WITH COMPOSER INSTALL
### ---
### - generate parameters.yml with override by environment variable
### - generate cache
if [ ${INIT_COMPOSER_INSTALL} -eq "1" ]; then

    ## Docker-sync (MacOS tool to sync code asynchronously to increase performance)
    ## Mandatory if you need to x
    while [ ! -f composer.json ] ;
    do
        echo "Wait for composer.json file"
        sleep 2
    done

    composer install --no-ansi --no-interaction --no-progress --optimize-autoloader --prefer-dist
fi

### XDEBUG ACTIVATION
### ---
### - dynamic configuration
### - active xdebug before fpm started
if [ ${INIT_XDEBUG_ACTIVATED} -eq "1" ]; then
    echo "zend_extension=xdebug" >> ~/etc/php7/00-xdebug.ini
    echo "[xdebug]" >> ~/php/00-xdebug.ini
    echo "xdebug.remote_port=${INIT_XDEBUG_REMOTE_PORT}" >> ~/etc/php7/00-xdebug.ini
    echo "xdebug.idekey=${INIT_XDEBUG_IDEKEY}" >> ~/etc/php7/00-xdebug.ini

        if [ -z "${INIT_XDEBUG_REMOTE_HOST}" ]; then
        echo "xdebug.remote_connect_back=1" >> ~/etc/php7/00-xdebug.ini
    else
        echo "xdebug.remote_host=${INIT_XDEBUG_REMOTE_HOST}" >> ~/etc/php7/00-xdebug.ini
    fi
fi

exec "$@"