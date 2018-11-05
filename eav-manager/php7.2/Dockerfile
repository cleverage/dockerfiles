FROM alpine:3.8
LABEL maintainer="Jean-Yves CAMIER <jycamier@clever-age.com>"

ARG USERID
ARG GROUPID

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

ENV COMPOSER_MEMORY_LIMIT -1
ENV COMPOSER_HOME /home/docker/.composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ADD basefiles /

WORKDIR /app

RUN addgroup -g ${GROUPID:-1000} -S docker && \
    adduser -u ${USERID:-1000} -S docker -G docker && \
    chown docker:docker /app && \
    echo "@php https://php.codecasts.rocks/v3.8/php-7.2" >> /etc/apk/repositories && \
    apk add --update \
        ca-certificates \
        wget \
        curl \
        vim \
        git \
        tini \
        php@php \
        php-fpm@php \
        php-bcmath@php \
        php-bz2@php \
        php-calendar@php \
        php-ctype@php \
        php-curl@php \
        php-dom@php \
        php-embed@php \
        php-gd@php \
        php-gettext@php \
        php-gmp@php \
        php-iconv@php \
        php-imagick@php \
        php-imap@php \
        php-intl@php \
        php-json@php \
        php-mbstring@php \
        php-mysqlnd@php \
        php-opcache@php \
        php-openssl@php \
        php-pdo@php \
        php-pdo_mysql@php \
        php-pdo_sqlite@php \
        php-pgsql@php \
        php-phar@php \
        php-posix@php \
        php-session@php \
        php-soap@php \
        php-sockets@php \
        php-sqlite3@php \
        php-xml@php \
        php-xmlreader@php \
        php-zip@php \
        php-zlib@php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    rm -rf /var/cache/apk/* && \
    composer global require hirak/prestissimo && \
    chown -R docker:docker /home/docker/.composer

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000
USER docker