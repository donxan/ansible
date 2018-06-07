#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
nginx_conf_update(){
    read -p "请确认你在修改配置前已经备份配置:y|n" c
    if [[ $c == "y" ]] || [[ $c == "Y" ]]
    then
      ansible-playbook /etc/ansible/nginx_config/update.yml
    elif [[ $c == "n" ]] || [[ $c == "N" ]]
    then
      echo "如果已经在ansible_nginx_conf配置中已经修改，你还可以通过客户端备份配置"
      exit 0
    else
      echo "Please input 'y' or 'n'."
    fi
}
nginx_conf_rollback(){
    read -p "请确认你现在是否回滚配置：y|n" c
    if [[ $c == "y" ]] || [[ $c == "Y" ]]
    then
      ansible-playbook /etc/ansible/nginx_config/rollback.yml
    elif [[ $c == "n" ]] || [[ $c == "N" ]]
    then
      exit 0
    else
      echo "Please input 'y' or 'n'."
    fi
}

case "$1" in
    update)
        nginx_conf_update
        ;;
    back)
        nginx_conf_rollback
        ;;
    *)
        echo "Please user update or back as your argument."
        ;;
esac
