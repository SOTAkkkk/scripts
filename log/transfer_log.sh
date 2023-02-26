#!/bin/bash -eu

# 環境変数
#

export today=`date "+%Y-%m-%d-%H"`

#mkdir ~/log

if [ ! -d ${HOME}/log ]
then
    # Create log directory if it doesn't exist
    mkdir ${HOME}/log
    echo "Log directory created at $(date)"
else
    echo "Log directory already exists"
fi

sudo cp /var/log/secure ~/log/secure_${today}.log
sudo cp /var/log/proftpd/all.log ~/log/proftpd_all_${today}.log
sudo cp /var/log/nginx/access.log ~/log/nginx_access_${today}.log
sudo cp /var/log/nginx/error.log ~/log/nginx_error_${today}.log