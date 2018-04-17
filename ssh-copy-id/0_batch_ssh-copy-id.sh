#!/bin/bash

hosts=(
192.168.23.125
192.168.23.126
192.168.23.128
)

# 部分操作系统默认配置的 sshd 是禁止 root 用户远程登录的
users=(
"cuc"
"cuc"
"root"
)

ports=(
22
22
22
)

i=0

install_python() {
  user="${1}"
  host="${2}"
  port="${3}"
  ret=$(ssh "${user}"@${host} -p ${port} 'if [[ $(uname -v) =~ .*Ubuntu.* ]];then echo ubuntu;fi')
  if [[ $ret = 'ubuntu' ]];then
    ssh "${user}"@${host} -p ${port} -t 'sudo apt update && sudo apt install python-minimal'
  fi
}

for host in "${hosts[@]}";do
  user=${users[$i]}
  ssh-copy-id -i "$HOME/.ssh/id_rsa.pub" "${user}"@${host} -p ${ports[$i]}
  # patch for Ubuntu 16.04 server without python-minimal installed as pre-requisite
  install_python "${user}" "${host}" "${ports[$i]}"
  i=$((i+1))
done

