# 9 Router_Lima - Router Ica
# Lima
en
conf t
hostname Router_Lima

interface s0/0/1
 description WAN_HACIA_ROUTER_ICA
 ip address 172.28.36.9 255.255.255.252
 no shutdown
 exit

router rip
 version 2
 no auto-summary
 network 172.28.0.0
 redistribute static
 exit
# Ica
en
conf t
hostname Router_Ica

interface s0/0/0
 description WAN_HACIA_ROUTER_LIMA
 ip address 172.28.36.10 255.255.255.252
 no shutdown
 exit

router rip
 version 2
 no auto-summary
 network 172.28.0.0
 redistribute static
 exit
