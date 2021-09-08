#!/bin/sh
iptables -t mangle -A OUTPUT -m owner --uid-owner 1000 -j MARK --set-mark 1000
iptables -t nat -A POSTROUTING -m mark --mark 1000 -j SNAT --to-source 108.160.135.152
iptables -t mangle -A OUTPUT -m owner --uid-owner 1001 -j MARK --set-mark 1001
iptables -t nat -A POSTROUTING -m mark --mark 1001 -j SNAT --to-source 45.76.101.123
iptables -t mangle -A OUTPUT -m owner --uid-owner 1002 -j MARK --set-mark 1002
iptables -t nat -A POSTROUTING -m mark --mark 1002 -j SNAT --to-source 108.61.180.81
service ss5 stop
ss5 -u lo1 -b 108.160.135.152
ss5 -u lo2 -b 45.76.101.123
ss5 -u lo3 -b 108.61.180.81
service ss5 start
