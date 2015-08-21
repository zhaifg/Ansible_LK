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

   cd mysql-5.1.73

    make install
    if [[ $? != 0 ]];then
        exit 1
    fi
    
    exit 0
fi
