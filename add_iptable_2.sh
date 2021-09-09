#!/bin/sh
if [ ! -d "/var/run/ss5" ];then
  mkdir /var/run/ss5
else
  echo "文件夹已经存在"
fi
iptables -t mangle -A OUTPUT -m owner --uid-owner 1000 -j MARK --set-mark 1000
iptables -t nat -A POSTROUTING -m mark --mark 1000 -j SNAT --to-source 158.247.210.160
iptables -t mangle -A OUTPUT -m owner --uid-owner 1001 -j MARK --set-mark 1001
iptables -t nat -A POSTROUTING -m mark --mark 1001 -j SNAT --to-source 141.164.37.70
iptables -t mangle -A OUTPUT -m owner --uid-owner 1002 -j MARK --set-mark 1002
iptables -t nat -A POSTROUTING -m mark --mark 1002 -j SNAT --to-source 141.164.46.181
service ss5 stop
ss5 -u lo1 -b 158.247.210.160
ss5 -u lo2 -b 141.164.37.70
ss5 -u lo3 -b 141.164.46.181
service ss5 start
