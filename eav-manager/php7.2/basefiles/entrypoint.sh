#!/bin/sh
set -e

export INIT_COMPOSER_INSTALL

### INIT PROJECT WITH COMPOSER INSTALL
### ---
### - generate parameters.yml with override by environment variable
### - generate cache
if [ ${INIT_COMPOSER_INSTALL:-"0"} -eq "1" ]; then

    ## Docker-sync (MacOS tool to sync code asynchronously to increase performance)
    ## Mandatory if you need to x
    while [ ! -f composer.json ] ;
    do
        echo "Wait for composer.json file"
        sleep 2
    done

    composer install --no-ansi --no-interaction --no-progress --optimize-autoloader --prefer-dist
fi

exec "$@"