#!/bin/bash
#判断是否是root用户
if [ $(id -u) != "0" ]; then
    echo " Not the root user! Try using sudo Command ! "
    exit 1
fi
#安装wget
yum install -y wget
#下载Mysql repo源
wget https://repo.mysql.com//mysql80-community-release-el8-1.noarch.rpm
#安装 yum repo文件并更新 yum 缓存
rpm -ivh mysql80-community-release-el8-1.noarch.rpm
#更新 yum
yum clean all
yum makecache
#安装MySQL
yum install -y mysql-community-server
#将mysql 服务加入开机启动项，并启动mysql进程
systemctl enable mysqld.service
systemctl start mysqld.service
