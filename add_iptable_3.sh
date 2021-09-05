#!/bin/sh
iptables -t mangle -A OUTPUT -m owner --uid-owner 1000 -j MARK --set-mark 1000
iptables -t nat -A POSTROUTING -m mark --mark 1000 -j SNAT --to-source 167.179.79.198
iptables -t mangle -A OUTPUT -m owner --uid-owner 1001 -j MARK --set-mark 1001
iptables -t nat -A POSTROUTING -m mark --mark 1001 -j SNAT --to-source 139.180.200.69
iptables -t mangle -A OUTPUT -m owner --uid-owner 1002 -j MARK --set-mark 1002
iptables -t nat -A POSTROUTING -m mark --mark 1002 -j SNAT --to-source 167.179.115.115
service ss5 stop
ss5 -u lo1 -b 167.179.79.198
ss5 -u lo2 -b 139.180.200.69
ss5 -u lo3 -b 167.179.115.115
service ss5 start
