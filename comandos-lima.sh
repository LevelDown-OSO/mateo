# Sede Lima

# AGREGAR VLAN IP A CORE

en
conf t

vlan 10
name ADMINISTRACION
exit

int vlan 10
ip address 172.28.41.1 255.255.255.128
exit

vlan 20
name LOGISTICA
exit

int vlan 20
ip address 172.28.42.65 255.255.255.224
exit

vlan 30
name VENTAS
exit

int vlan 30
ip address 172.28.40.1 255.255.255.0
exit

vlan 40
name FINANZAS
exit

int vlan 40
ip address 172.28.41.129 255.255.255.192
exit

vlan 50
name MARKETING
exit

int vlan 50
ip address 172.28.42.1 255.255.255.192
exit

vlan 60
name WIFI_CLIENTES
exit

int vlan 60
ip address 172.28.43.1 255.255.255.0
exit

vlan 70
name SERVIDORES
exit

vlan 80
name WIFI_EJECUTIVOS
exit

vlan 99
name NATIVA
exit
