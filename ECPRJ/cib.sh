#!/bin/bash


[[ ! -d "/home/cib"  ]] && mkdir /home/cib  && cp -f /etc/skel/* /home/cib && chown -R cib.cib /home/cib && chmod -R 700 /home/cib
