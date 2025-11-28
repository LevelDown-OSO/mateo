# Configurar FTP
# crear usuario y contra con permisos para cada vlan
# Agregar el firewall para que acepte unicamente la red local todo menos en lima que accede todos

# Configurar DHCP
# Configuramos la pool de direcciones en dhcp
# basicamente le estamos diciendo que si alguien pide una direccion ip entonces, elige una disponible nada mas.
# aca influye mucho la configuracion de la vlan, los dispositivos no tiene ip asi que la forma de redirigir es
# mediante la vlan


# dhcp

# switch core
en
conf t

int vlan 60
ip helper-address 172.28.42.164
exit

int vlan 80
ip helper-address 172.28.42.164
exit
