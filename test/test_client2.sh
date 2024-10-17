#!/bin/bash

echo "start"
echo $1

#./main --client $1 --port 443 &
#./main --client $1 --port 80 --proxy --ipproxy $2 --portproxy $3 &
#./main --client $1 --port 443 --tls &
../pkg/vpn_proxy --client $1 --port 443 --proxy --ipproxy $2 --portproxy $3 --tls &

sleep 2

#eth0 接口上增加一个 IPv4 地址 192.168.1.100，子网掩码为 24（即 255.255.255.0），命令如下：
ip addr add dev vpn0 192.168.66.68/24
#强制网卡linkup
ip link set up dev vpn0

bash
