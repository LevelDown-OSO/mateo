# Switch Core Ica
conf t

vlan 10
 name ADMINISTRACION
exit

interface vlan 10
 ip address 172.28.48.129 255.255.255.192
exit

vlan 20
 name LOGISTICA
exit

interface vlan 20
 ip address 172.28.49.1 255.255.255.240
exit

vlan 30
 name VENTAS
exit

interface vlan 30
 ip address 172.28.48.1 255.255.255.128
exit

vlan 40
 name FINANZAS
exit

interface vlan 40
 ip address 172.28.48.193 255.255.255.224
exit

vlan 50
 name MARKETING
exit

interface vlan 50
 ip address 172.28.48.241 255.255.255.240
exit

vlan 60
 name WIFI_CLIENTES
exit

interface vlan 60
 ip address 172.28.49.33 255.255.255.248
exit

vlan 70
 name SERVIDORES
exit

interface vlan 70
 ip address 172.28.49.41 255.255.255.248
exit

vlan 80
 name WIFI_EJECUTIVOS
exit

interface vlan 80
 ip address 172.28.48.225 255.255.255.240
exit

vlan 99
 name NATIVA-GESTION
exit

interface vlan 99
 ip address 172.28.49.17 255.255.255.240
exit

ip routing
end


# PASO 8
# configurcion de router a switch core ica
#
# Switch Core
en
conf t

interface g1/0/1
 no switchport
 description ENLACE_HACIA_ROUTER_ICA
 ip address 172.28.36.5 255.255.255.252
 no shutdown
 exit

ip route 0.0.0.0 0.0.0.0 172.28.36.6

# Router
en
conf t
hostname Router_Ica

interface g0/0
 description ENLACE_HACIA_CORE_ICA
 ip address 172.28.36.6 255.255.255.252
 no shutdown
 exit

ip route 172.28.48.0 255.255.252.0 172.28.36.5


# configuracion del dhcp para conectar las redes de wifi
# switch core
! --- WIFI EJECUTIVOS (VLAN 80) ---
interface vlan 80
 ip helper-address 172.28.49.44
 no shutdown
 exit

! --- WIFI CLIENTES (VLAN 60) ---
interface vlan 60
 description Gateway Wifi Clientes
 ip helper-address 172.28.49.44
 no shutdown
 exit
