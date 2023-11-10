#! /bin/bash

sudo su
# 更换 ubuntu 源
sudo sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sudo sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sudo apt clean
sudo apt-get update -y
sudo apt-get install -y build-essential proxychains4 net-tools git vim selinux-utils ebtables socat conntrack ipset ipvsadm net-tools containerd
# sudo apt install -y chrony-devel nfs-common nfs-kernel-server ceph-client glusterfs-client 
# 关闭防火墙
sudo ufw disable
# 关闭 selinx
sudo setenforce 0
echo SELINUX=disabled | sudo tee -a /etc/selinux/config
# 关闭 swap
sudo swapoff -a
sudo sed -ri 's/.*swap.*/#&/' /etc/fstab

# root password
sed -i '/PermitRootLogin /c PermitRootLogin yes' /etc/ssh/sshd_config
sed -i '/PasswordAuthentication /c PasswordAuthentication yes' /etc/ssh/sshd_config
service sshd restart
systemctl restart sshd

# PROXY
sed -i '/socks4 /c socks5 127.0.0.1 1080' /etc/proxychains4.conf
echo "alias proxy='proxychains -q'" >> ~/.bashrc
echo "alias ipip='curl -s http://myip.ipip.net'" >> ~/.bashrc
source ~/.bashrc

# dns resolve.conf
echo "nameserver 114.114.114.114" >> /etc/resolv.conf
echo "nameserver 223.5.5.5" >> /etc/resolv.conf
echo "nameserver 223.6.6.6" >> /etc/resolv.conf


wget https://github.com/trojan-gfw/trojan/releases/download/v1.16.0/trojan-1.16.0-linux-amd64.tar.xz
tar xf trojan-1.16.0-linux-amd64.tar.xz -C /tmp
cp -a /tmp/trojan/trojan /usr/bin/trojan
chmod +x /usr/bin/trojan
pkill -f trojan
# /usr/bin/trojan -c /etc/trojan-client.json -l trojan.log 2>&1 &

systemctl enable trojan
systemctl start trojan
systemctl status trojan

proxy curl -s http://myip.ipip.net

# 确认本机1080端口是否存在

# export http_proxy=http://127.0.0.1:1080
# export FTP_PROXY=http://127.0.0.1:1080
# export ftp_proxy=http://127.0.0.1:1080
# export all_proxy=socks://127.0.0.1:1080
# export ALL_PROXY=socks://127.0.0.1:1080
# export HTTPS_PROXY=http://127.0.0.1:1080
# export https_proxy=http://127.0.0.1:1080
# export HTTP_PROXY=http://127.0.0.1:1080
# export no_proxy=localhost,127.0.0.1



# 下载安装脚本并安装 Docker
# curl -fsSL get.docker.com -o get-docker.sh
# sudo sh get-docker.sh --mirror Aliyun
# # 启动 Docker
# sudo systemctl enable docker
# sudo systemctl start docker
# sudo usermod -aG docker $USER
# # docker 镜像加速
# cat <<EOF | sudo tee /etc/docker/daemon.json
# {
#   "registry-mirrors": [
#     "https://hub-mirror.c.163.com",
#     "https://mirror.baidubce.com"
#   ]
# }
# EOF
# sudo systemctl daemon-reload
# sudo systemctl restart docker

