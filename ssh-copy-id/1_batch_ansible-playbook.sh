#!/bin/bash
# http://docs.ansible.com/ansible/latest/become.html#id5
# 缺陷：所有主机使用的 su / sudo 密码必须一致（因为只提示输入一次 su / sudo 密码）
ansible-playbook -i hosts ssh-copy-id.yml 

