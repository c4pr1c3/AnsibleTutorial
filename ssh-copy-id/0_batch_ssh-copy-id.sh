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

for host in "${hosts[@]}";do
  user=${users[$i]}
  ssh-copy-id -i "$HOME/.ssh/id_dsa.pub" "${user}"@${host} -p ${ports[$i]}
  i=$((i+1))
done

