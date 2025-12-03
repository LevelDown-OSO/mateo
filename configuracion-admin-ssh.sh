# SSH
# router
# SW1, SW2, SW3, D1, D2, D3, SW Core, Router
# PC ADMIN 172.28.42.104 LIMA
# ACL para aceptar solamente pc admin
en
conf t
ip access-list standard FILTRO_GESTION
permit host 172.28.45.66 # IP DE LA PC QUE CONTROLA TODO
deny any
exit

int vlan 99
ip add 172.28.45.69 255.255.255.240 # IP PARA EL DISPOSITIVO
no shutdown
exit
ip default-gateway 172.28.45.65

hostname Router_La_Libertad

ip domain-name miempresa.com
username admin secret admin
crypto key generate rsa
1024
line vty 0 4
login local
transport input ssh
access-class FILTRO_GESTION in
exit
ip ssh version 2
# comprobar
show ip ssh

# pc
ssh -l admin <ip>

# TELNET (APLICACION:23)
# Switch
# en secret cisco

# line vty 0 4
# password class
# login
