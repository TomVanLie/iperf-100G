iptables -t nat -A POSTROUTING -s 10.50.0.1 -d 10.60.1.1 -j SNAT --to-source 10.60.0.1
iptables -t nat -A PREROUTING -d 10.60.0.1 -j DNAT --to-destination 10.50.0.1
iptables -t nat -A POSTROUTING -s 10.50.1.1 -d 10.60.0.1 -j SNAT --to-source 10.60.1.1
iptables -t nat -A PREROUTING -d 10.60.1.1 -j DNAT --to-destination 10.50.1.1
ip route add 10.60.1.1 dev ens2f0np0
arp -i ens2f0np0 -s 10.60.1.1 88:e9:a4:53:3a:2d
ip route add 10.60.0.1 dev ens2f1np1
arp -i ens2f1np1 -s 10.60.0.1 88:e9:a4:53:3a:2c

ethtool -U ens2f1np1 flow-type tcp4 dst-port 5002 action 1 
ethtool -U ens2f1np1 flow-type tcp4 dst-port 5003 action 3
ethtool -U ens2f1np1 flow-type tcp4 dst-port 5004 action 5 
ethtool -U ens2f1np1 flow-type tcp4 dst-port 5005 action 7
ethtool -U ens2f1np1 flow-type tcp4 dst-port 5006 action 9
ethtool -U ens2f1np1 flow-type tcp4 dst-port 5007 action 11
ethtool -U ens2f1np1 flow-type tcp4 dst-port 5008 action 13
ethtool -U ens2f1np1 flow-type tcp4 dst-port 5009 action 15
