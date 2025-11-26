# Router



# R0 FRONTERA X

default-information originate

no auto-summary



# R_ISP X

en

conf t

hostname R_ISP



# R0 -> Switch 1 X

en

conf t

int f0/1

ip add 192.168.1.1 255.255.255.0

no shutdown

exit



# R_ISP -> Switch 2 X

en

conf t

int f0/1

ip add 14.196.179.1 255.255.255.0

no shutdown

exit



# R1 -> Switch 3 X

en

conf t

int f0/1

ip add 192.168.3.1 255.255.255.0

no shutdown

exit



# Probar networking de end -> router



# R0 -> R1 X

en

conf t

int s0/0/0

ip add 192.168.6.1 255.255.255.0

no shutdown

exit



# R1 -> R0 X

en

conf t

int s0/0/0

ip add 192.168.6.2 255.255.255.0

no shutdown

exit



# R0 -> R_ISP XX

en

conf t

int f0/0

ip add 205.0.0.1 255.255.255.0

no shutdown

exit



ip route 0.0.0.0 0.0.0.0 205.0.0.2



# R_ISP -> R0

en

conf t

int f0/0

ip add 205.0.0.2 255.255.255.0

no shutdown

exit



ip route 192.168.0.0 255.255.248.0 205.0.0.1















# ver tabla de routing

sho ip rou





# configuracion del dns

# prender https y asignar name y ip del web server (REVISAR EL CORRECTO IP)



# configuracion ftp

# agregar username y password minimo 2 usuarios

username ftpuser password ftpuser



# acceder ftp

# ftp <ip-ftp>
