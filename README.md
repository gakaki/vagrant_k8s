vagrant package --output gakaki-ubuntu.box
vagrant box add gakaki/ubuntu gakaki-ubuntu.box


# Vagrant



# command

vagrant version


# 创建基础ubuntu aliyun 镜像和所有的build

gakaki/ubuntu/23



# ubuntu 国内vagrant镜像

https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/lunar/current/
lunar-server-cloudimg-amd64-vagrant.box

638MB

ubuntu/lunar64

vagrant box add ubuntu23.04 https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/lunar/current/lunar-server-cloudimg-amd64-vagrant.box



vagrant box add ubuntu/jammy64  https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/jammy/current/jammy-server-cloudimg-amd64-vagrant.box


公司网络效果还不错 也是6m 一秒
vagrant box add gyptazy/ubuntu22.04-arm64



下载要3分钟

https://app.vagrantup.com/ubuntu/boxes/jammy64


22.04  Jammy Jellyfish
23.04  Lunar Lobster
23.10  Mantic Minotaur

https://getiot.tech/zh/ubuntu/ubuntu-versions

Ubuntu 23.04	Lunar Lobster	2023-04-20	2024-01	Linux 6.2
Ubuntu 22.10	Kinetic Kudu	2022-10-20	2023-07	Linux 5.19
Ubuntu 22.04 LTS	Jammy Jellyfish	2022-04-21	2027-04	Linux 5.15


# kubekey latest version v1.28.3	
https://github.com/kubesphere/kubekey/blob/master/docs/kubernetes-versions.md
# k3s version v1.24.7	
https://github.com/kubesphere/kubekey/blob/master/docs/k3s-versions.md



order-center-service



# 创建自己的vagrant box 

tree ~/.vagrant.d/boxes/

vagrant box list

vagrant box add generic 

vagrant box remove

vagrant plugin list

vagrant plugin install vagrant-vbguest --plugin-version 0.21

vagrant ssh-config

vagrant ssh
vagrant upload

vagrant package --base yourbox-name
vagrant box add --name my-ubnut --provider=virtualbox .\package.box