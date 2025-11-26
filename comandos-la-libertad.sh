# Sede Lima

# AGREGAR VLAN IP A CORE
conf t

vlan 10
name ADMINISTRACION
exit

int vlan 10
 ip address 172.28.44.129 255.255.255.192
exit


vlan 20
name LOGISTICA

exit

int vlan 20
 ip address 172.28.45.33 255.255.255.240
exit


vlan 30
name VENTAS

exit

int vlan 30
 ip address 172.28.44.1 255.255.255.128
exit



vlan 40
name FINANZAS
exit

int vlan 40
 ip address 172.28.44.193 255.255.255.224
exit


vlan 50
name MARKETING

exit

int vlan 50
 ip address 172.28.45.1 255.255.255.224
exit


vlan 60
name WIFI_CLIENTES
exit

int vlan 60
 ip address 172.28.45.49 255.255.255.240
exit


vlan 70
name SERVIDORES
exit

int vlan 70
 ip address 172.28.45.81 255.255.255.248
exit


vlan 80
name WIFI_EJECUTIVOS
exit

int vlan 80
 ip address 172.28.44.225 255.255.255.224
exit


vlan 99
name NATIVA
exit

int vlan 99
 ip address 172.28.45.65 255.255.255.240
exit

ip routing

# PASO 8 configuracion de router con switch core
# switch CORE
en
conf t

interface g1/0/1
 no switchport
 description ENLACE_WAN_HACIA_ROUTER
 ip address 172.28.36.1 255.255.255.252
 no shutdown
 exit

ip route 0.0.0.0 0.0.0.0 172.28.36.2
exit

# router

en
conf t
hostname Router_Lima

interface g0/0
 ip address 172.28.36.2 255.255.255.252
 no shutdown
 exit

ip route 172.28.40.0 255.255.252.0 172.28.36.1
