FROM debian:9

RUN apt-get update \
&& apt-get install git php7.0-cli php7.0-mysql mariadb-server wget -yqq

WORKDIR /app

EXPOSE 8192/tcp

CMD rm -rf dip-site4 >/dev/null 2>&1 \
; git clone "https://github.com/Lelenaic/dip-site4" \
; service mysql start \
; echo "drop database if exists dip_site4; create database dip_site4;" | mysql -uroot \
; cd dip-site4 \
; wget http://getcomposer.org/composer.phar \
; php composer.phar du \
; mysql -uroot dip_site4 < tasks.sql \
; php -S 0.0.0.0:8192