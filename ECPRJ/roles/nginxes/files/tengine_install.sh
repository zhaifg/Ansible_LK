#!/bin/bash

if [[ ! -d "/etc/nginx" ]]; then
    mkdir -p /etc/nginx
fi

if [[ ! -d "/var/log/nginx" ]]; then
    mkdir -p /var/log/nginx
fi


if [[ ! -d "/var/lib/nginx/tmp/client_body" ]]; then
    mkdir -p /var/lib/nginx/tmp/{client_body,fastcgi,uwsgi}
fi


if [[ ! -d "/etc/nginx" ]]; then
    mkdir -p /etc/nginx
fi


cd /tmp/tengine-2.1.1
./configure --prefix=/usr/share/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf \
   --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log \
   --http-client-body-temp-path=/var/lib/nginx/tmp/client_body \
   --http-proxy-temp-path=/var/lib/nginx/tmp/proxy \
   --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi \
   --http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi \
   --http-scgi-temp-path=/var/lib/nginx/tmp/uwsgi \
   --pid-path=/var/run/nginx.pid \
   --lock-path=/var/lock/subsys/nginx \
   --user=nginx --group=nginx --with-file-aio  \
   --with-http_ssl_module --with-http_realip_module \
   --with-http_stub_status_module \
   --enable-mods-shared=all --with-http_spdy_module \
   --with-http_realip_module --with-http_gunzip_module \
   --with-http_gzip_static_module --with-http_auth_request_module \
   --with-pcre --add-module=../ngx_cache_purge-2.3 \
   --with-http_stub_status_module

   if [[ $?  -ne 0 ]]; then
 #      failure "Tengie configure has error"
       exit 1
   fi
   make && make install
   if [[ $?  -ne 0 ]]; then
#       failure "Tengie make  or install  has error"
       exit 1
   fi
  cd ..
