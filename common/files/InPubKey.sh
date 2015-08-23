#!/bin/bash

#USER={{ remote_user  }}


if [[  -d /root/.ssh  ]];then 
    cat /tmp/id_rsa_manager_root_prv.pub >> /root/.ssh/authorized_keys
    chmod 400 /root/.ssh/authorized_keys
  
else
    mkdir /root/.ssh && chmod -R 700 /root/.ssh
    cat /tmp/id_rsa_manager_root_prv.pub >> /root/.ssh/authorized_keys 
    chmod 400 /root/.ssh/authorized_keys 
    
fi
