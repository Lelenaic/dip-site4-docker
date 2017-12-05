FROM debian:9

RUN apt-get update \
&& apt-get install git php7.0-cli php7.0-mysql mariadb-server -yqq

WORKDIR /app

CMD git clone "https://github.com/Lelenaic/dip-site4" . ;\
php -S 0.0.0.0:8192