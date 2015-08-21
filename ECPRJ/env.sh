#!/bin/bash


\cp -f /etc/skel/{.bash_logout,.bash_profile,.bashrc} /home/cib && chown -R cib.cib /home/cib && chmod -R 700 /home/cib

