#!/bin/bash

flag=`fdisk -l | sed -n '/dev\/sdc1/p'`
flag2=`fdisk -l | sed -n '/dev\/sdc/p'`

if [[ $flag -eq "" ]];then
if [[ $flag2 != "" ]];then
   fdisk /dev/sdc << EOF
n
p
1


t
8e
wq
EOF

protprobe

pvcreate /dev/sdc1
vgcreate vgdata /dev/sdc1
lvcreate -l 100%FREE -n lvdata vgdata
mkfs.ext4 /dev/vgdata/lvdata > /dev/null

mv /home/cib  /tmp
mount /dev/vgdata/lvdata /home
mv /tmp/cib /home/
chown -R cib.cib /home/cib && chmod -R 700 /home/cib
mkdir /root/backup -p
cp /etc/fstab /root/backup/

echo "/dev/vgdata/lvdata   /home    ext4    defaults     1  2" >> /etc/fstab
fi
exit 0
fi
