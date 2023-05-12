ip route add 10.60.1.1 dev ens2f0np0
arp -i ens2f0np0 -s 10.60.1.1 88:e9:a4:53:3a:2d
ip route add 10.60.0.1 dev ens2f1np1
arp -i ens2f1np1 -s 10.60.0.1 88:e9:a4:53:3a:2c
