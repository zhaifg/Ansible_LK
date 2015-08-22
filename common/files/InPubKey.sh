#!/bin/bash

#USER={{ remote_user  }}


if [[  -d /root/.ssh  ]];then 
    cat /tmp/id_rsa.pub >> /root/.ssh/known_hosts
    chmod 400 /root/.ssh/known_hosts
  
else
    mkdir /root/.ssh && chmod -R 700 /root/.ssh
    cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys 
    chmod 400 /root/.ssh/authorized_keys 
    
fi
