#!/bin/sh

mkdir -p /usr/local/www
cd /usr/local/www
git clone https://github.com/linuxserver/Heimdall.git --depth 1 heimdall
cd heimdall
cp .env.example .env
php artisan key:generate
chown -R www:www .

cp /usr/local/etc/nginx-heimdall-no-ssl.conf /usr/local/etc/nginx/nginx.conf

sysrc php_fpm_enable=YES
sysrc nginx_enable=YES

service php-fpm start
service nginx start

