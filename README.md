Dockerfiles
==

Clever Age's Dockerfiles

### Images cleverage/eav-manager

| Images                | Tags       | Main feature               |
|-----------------------|------------|----------------------------|
| cleverage/eav-manager | php7.2     | php7.2, fpm, composer, git |
| cleverage/eav-manager | php7.2-dev | zsh, xdebug                |

#### Environment variables (php7.2-dev)

| Variables               | Default Value  | Default Value  | 
|-------------------------|----------------|----------------|
| INIT_XDEBUG_ACTIVATED   | 0              | Active Xdebug  |
| INIT_XDEBUG_REMOTE_PORT | 9000           | Xdebug conf    |
| INIT_XDEBUG_IDEKEY      | PHPSTORM       | Xdebug IDEKey  |
| INIT_XDEBUG_REMOTE_HOST | ~              | Xdebug Remote Host (if custom) |
| INIT_COMPOSER_INSTALL   | ~              | Launch Composer install at entrypoint |
| INIT_PHP_ENABLED_MODULES   | ~              | String of space-separated modules to enabled (for meminfo) |

## Setup Xdebug Remote Host

**On Mac**, default `INIT_XDEBUG_REMOTE_HOST` value should work without custom configuration.

**On Linux**, 2 ways available:

1. Set `INIT_XDEBUG_REMOTE_HOST` with your Docker IP.
Commands like `ip -4 addr show docker0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'` or `docker network inspect [NETWORK_NAME] | grep Gateway | grep -o -E '[0-9\.]+'`

2. Add `extra_hosts` in your docker-compose.yml

```
    extra_hosts:
      - "host.docker.internal:${DOCKER_HOST_IP}"
```

and set `DOCKER_HOST_IP` in your shell.
