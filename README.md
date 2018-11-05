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
| INIT_XDEBUG_REMOTE_HOST | ~              | Xdebug Remote Host |
| INIT_COMPOSER_INSTALL   | ~              | Launch Composer install at entrypoint |





