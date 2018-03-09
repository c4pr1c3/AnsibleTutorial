#!/bin/bash

ansible-playbook -i hosts manage-users.yml --ask-vault
ansible-playbook -i hosts vault-manage-users.yml --ask-vault

