#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
rsync -av  /etc/ansible/nginx_config/roles/new/ /etc/ansible/nginx_config/roles/old/
if [[ $? -eq 0 ]];then
  echo "nginx配置已经备份完毕，您可以修改配置了"
fi
