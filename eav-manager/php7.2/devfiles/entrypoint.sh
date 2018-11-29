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
if [ "${INIT_COMPOSER_INSTALL}" -eq "1" ]; then

    ## Docker-sync (MacOS tool to sync code asynchronously to increase performance)
    ## Mandatory if you need to x
    while [ ! -f composer.json ] ;
    do
        echo "Wait for composer.json file"
        sleep 2
    done

    composer install --no-ansi --no-interaction --no-progress --optimize-autoloader
fi

### XDEBUG ACTIVATION
### ---
### - dynamic configuration
### - active xdebug before fpm started
if [ "${INIT_XDEBUG_ACTIVATED}" -eq "1" ]; then

    sed -i "s/xdebug\.remote_autostart\=.*/xdebug\.remote_autostart\=1/g" ~/etc/php7/00-xdebug.ini
    sed -i "s/xdebug\.remote_enable\=.*/xdebug\.remote_enable\=1/g" ~/etc/php7/00-xdebug.ini
    sed -i "s/xdebug\.remote_connect_back\=.*/xdebug\.remote_connect_back\=1/g" ~/etc/php7/00-xdebug.ini

    if [ "${INIT_XDEBUG_REMOTE_PORT}" -eq "1" ]; then
        # Default to 9000
        sed -i "s/xdebug\.remote_port\=.*/xdebug\.remote_port\=${INIT_XDEBUG_REMOTE_PORT}/g" ~/etc/php7/00-xdebug.ini
    fi

    if [ -n "${INIT_XDEBUG_IDEKEY}" ]; then
        # Default to PHPSTORM
        sed -i "s/xdebug\.idekey\=.*/xdebug\.idekey\=${INIT_XDEBUG_IDEKEY}/g" ~/etc/php7/00-xdebug.ini
    fi

    if [ -n "${INIT_XDEBUG_REMOTE_HOST}" ]; then
        sed -i "s/#xdebug\.remote_host\=.*/xdebug\.remote_host\=${INIT_XDEBUG_REMOTE_HOST}/g" ~/etc/php7/00-xdebug.ini
    fi
fi

exec "$@"
