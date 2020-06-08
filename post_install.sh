#!/bin/sh

echo "Installing Heimdall repo..."
mkdir -p /usr/local/www
cd /usr/local/www
git clone https://github.com/linuxserver/Heimdall.git --depth 1 heimdall 
cd heimdall
cp .env.example .env

echo "Generating application key..."
php artisan key:generate > /dev/null 2>&1
chown -R www:www .

echo "Generating self-signed SSL certificate..."
/usr/local/bin/heimdall-generate-sslcert.sh > /dev/null 2>&1

echo "Configuring services..."
cp -v /usr/local/etc/heimdall/nginx-heimdall-default.conf /usr/local/etc/nginx/nginx.conf
cp -v /usr/local/etc/php.ini-production /usr/local/etc/php.ini

sysrc php_fpm_enable=YES
sysrc nginx_enable=YES

service php-fpm start
service nginx start

cat /root/PLUGIN_INFO

