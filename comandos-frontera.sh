# Router



# R0 FRONTERA X
en
conf t
router rip
version 2
default-information originate
no auto-summary
exit

# Router Frontera - ISP 1
# Router Frontera
interface s0/0/0
 ip address 11.13.20.1 255.255.255.252
 no shutdown
 exit

# ISP 1
en
conf t

interface s0/2/0
 ip address 11.13.20.2 255.255.255.252
 clock rate 128000
 no shutdown
 exit

# Router Frontera - ISP 2 Backup
# Router Frontera
interface s0/1/1
 ip address 11.13.20.5 255.255.255.252
 no shutdown
 exit
# ISP 2
en
conf t

interface s0/2/0
 ip address 11.13.20.6 255.255.255.252
 clock rate 128000
 no shutdown
 exit


# Router frontera

en
conf t
ip route 0.0.0.0 0.0.0.0 11.13.20.2
ip route 0.0.0.0 0.0.0.0 11.13.20.6 5


# ISP 1
ip route 172.28.0.0 255.255.0.0 11.13.20.1

# ISP 2
ip route 172.28.0.0 255.255.0.0 11.13.20.5




# gemini
# roputer lima
conf t
interface Serial0/0/0
 shutdown

 no shutdown
 exit

# isp 1
en
conf t
interface Serial0/2/0
 encapsulation hdlc
 clock rate 128000
 no shutdown
 exit


# ADASDASD
# rOUTER lima
en
conf t

! Configuración de RIP para propagar internet a la LAN
router rip
 version 2
 default-information originate
 no auto-summary
 exit

! Interfaz hacia ISP 1 (Principal)
interface s0/0/0
 description ENLACE_ISP1_PRINCIPAL
 ip address 11.13.20.1 255.255.255.252
 no shutdown
 exit

! Interfaz hacia ISP 2 (Backup)
interface s0/1/1
 description ENLACE_ISP2_BACKUP
 ip address 11.13.20.5 255.255.255.252
 no shutdown
 exit

! Rutas estáticas (El truco del Backup)
ip route 0.0.0.0 0.0.0.0 11.13.20.2
ip route 0.0.0.0 0.0.0.0 11.13.20.6 5


#ISP 1
en
conf t
interface s0/2/0
 description CONEXION_CLIENTE_LIMA
 ip address 11.13.20.2 255.255.255.252
 clock rate 128000
 no shutdown
 exit

! Ruta de regreso para saber cómo responder a tu red interna
ip route 172.28.0.0 255.255.0.0 11.13.20.1
