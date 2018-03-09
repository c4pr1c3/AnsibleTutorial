# Ansible 实例教程

## 使用 Ansible 的基本条件

以下条件建议使用 Shell 脚本方式完成自动化或手工配置完成。

* 目标主机已安装了 ``openssh-server``
* 已经配置完成了 SSH 免密登录，推荐配置以支持 root 用户免密登录

### Shell 脚本方式自动配置的实例

[ssh-copy-id/](ssh-copy-id/)

```bash
# 顺序执行以下2个脚本
# 按照提示，依次输入远程主机的用户登录密码
0_batch_ssh-copy-id.sh

# 按照提示，输入远程主机非root用户的 su 密码
# 如果需要使用 sudo 密码，请修改 ssh-copy-id.yml 中的 become_method 值为 sudo
1_batch_ansible-playbook.sh
```

### 管理用户的实例

[manage-users/](manage-users/)

示例 ``manage-users/group_vars/manage-users/vault.yml`` 文件使用的解密口令为： **password**

### 运维配置任务实例

[manage-tasks/](manage-tasks/)

