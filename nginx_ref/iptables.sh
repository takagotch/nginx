#!/bin/bash

#
/sbin/iptables -F
/sbin/iptables -Z
/sbin/iptables -X

#
/sbin/iptables -P INPUT DROP
/sbin/iptables -P OUTPUT ACCEPT
/sbin/iptables -P FORWARD DROP

#
/sbin/iptables -A INPUT -i lo -j ACCEPT
/sbin/iptables -A OUTPUT -o lo -j ACCEPT

#
/sbin/iptables -A INPUT -i eth0 -p tcp ! --syn -m state --state --state NEW -j DROP
#
/sbin/iptables -A INPUT -i eth0 -f -j DROP
/sbin/iptables -A INPUT -i eth0 -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
/sbin/iptables -A INPUT -i eth0 -p tcp --tcp-flags ALL -j DROP

#
/sbin/iptables -A INPUT -i eth0 -p tcp --tcp-flags ALL NONE -j DROP
/sbin/iptables -A INPUT -i eth0 -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

#
/sbin/iptables -A INPUT -i eh0 -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
#
/sbin/iptables -A INPUT -i eh0 -p tcp --tcp-flags FIN,ACK FIN -j DROP
/sbin/iptables -A INPUT -i eh0 -p tcp --tcp-flags ALL AYN,RST,ACK,FIN,URG -j DROP

#
/sbin/iptables -A INPUT -i eh0 -m pkktype --pkt-type broadcast -j DROP

#
/sbin/iptables -A INPUT -i eth0 -m pkktype --pkt-type multicast -j DROP

#
/sbin/iptables -A INPUT -i eth0 -m state --state INVALID -J DROP

#
#
SPOOFIP="192.168.0.0 ..."

/sbin/iptables -N spooflist
for ipblock in $SPOOFIP
do
	/sbin/iptables -A spooflist -i eth0 -s $ipblock -j DROP done
/sbin/iptables -I INPUT -j spooflist
/sbin/iptables -I OUTPUT -j spooflist
/sbin/iptables -I FORWARD -j spooflist

#
/sbin/iptables -A INPUT -i eth0 -p tcp -s --sport 1024:65535 --dport 80 -m state NEW,ESTABLISHED -j ACCEPT

#
/sbin/iptables -A INPUT -m limit --limit 5/m --limit-burst 7 -j LOG --log-prefix " DEFAULT DROP "
/sbin/iptables -A INPUT -j DROP

exit 0
#sh iptables.sh
#/sbin/iptables -A INPUT -i eth0 -p tcp -s 0/0 --sport 1024:65535 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT