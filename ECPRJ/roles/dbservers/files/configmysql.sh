#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

MYSQL_USER=mysql
MYSQL_GROUP=mysql
MYSQL_PREFIX="/usr/local/mysql"
MYSQL_VER="mysql-5.1.73"
MYSQL_DATA_DIR="/mydata/data"


cd /tmp

if [[ ! -d "mysql-5.1.73" ]];then
   echo "The mysql-5.1.73 does not exist;"
   exit 1

else
   rm /etc/my.cnf -f
   mkdir -p /mydata/data/logs/{binlog,relaylog}
   chown -R mysql.mysql /mydata

   cd mysql-5.1.73
   
CHOST="x86_64-pc-linux-gnu"
CFLAGS="-march=nocona -O3 -pipe"
./configure --prefix=$MYSQL_PREFIX \
            --enable-assembler \
            --with-server-suffix=-LKOS \
            --with-charset=utf8 \
            --with-collation=utf8_general_ci \
            --with-fast-mutexes \
            --with-zlib-dir=bundled \
            --enable-assembler \
            --enable-profiling \
            --with-pthread \
            --with-client-ldflags=-all-static \
            --with-mysqld-ldflags=-all-static \
            --with-extra-charsets=complex \
            --enable-thread-safe-client \
            --with-big-tables \
            --with-readline \
            --with-ssl --with-embedded-server \
            --enable-local-infile \
            --without-geometry --without-debug \
            --without-ndb-debug \
            --with-plugins=partition,blackhole,csv,heap,innobase,myisam,myisammrg


    if [[ $? != 0 ]];then
        exit 1
    fi
    
    exit 0
fi
