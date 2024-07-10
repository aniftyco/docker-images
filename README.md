# Docker Images

> Collection of base Docker images

This is a collection of base docker images for NiftyCo products and services to use.

| Image                         | Description                                                                                                                                      |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `[aniftyco/php](php)`         | Sets up everything necessary to run a PHP application using PHP 8.3, Composer 2.7 and Caddy 2.7 on Alpine Linux 3.19                             |
| `[aniftyco/laravel](laravel)` | Extends `[aniftyco/php](php)` to add support for installing and building assets in Node.js 20.12 using npm 10.2 and configures Caddy for Laravel |
