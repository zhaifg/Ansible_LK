#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

MYSQL_USER=mysql
MYSQL_GROUP=mysql
MYSQL_PREFIX="/usr/local/mysql"
MYSQL_VER="mysql-5.1.73"
MYSQL_DATA_DIR="/mydata/data"



$MYSQL_PREFIX/bin/mysql_install_db \
        --basedir=$PREFIX_MYSQL \
        --datadir=$MYSQL_DATA_DIR \
        --user=$MYSQL_USER \
        --defaults-file=$MYSQL_DATA_DIR/my.cnf 

   


    if [[ $? != 0 ]];then
        exit 1
    fi
    
    exit 0
