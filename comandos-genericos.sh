# 1. cambiamos los nombres de cada dispositivo

# 2. Configurar APTS de los telefonos
#   Agregamos el power supply para los switches donde sea necesario

# 3. Configurar IP's


# 4. Crear el nombre de las vlan para switches no core

en
conf t

vlan 10
name ADMINISTRACION
exit

vlan 20
name LOGISTICA
exit

vlan 30
name VENTAS
exit

vlan 40
name FINANZAS
exit

vlan 50
name MARKETING
exit

vlan 60
name WIFI_CLIENTES
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

# metemos todos los comandos de arriba en todos los switches menos el core este 'core' tendra ademas las ip's


# 5. Configuracion conexion de vlan entre dispositivos finales y su switch inmediato

# D1
en
conf t

int g1/0/2
switchport mode access
switchport access vlan 80
no shutdown
exit

int g1/0/3
switchport mode access
switchport access vlan 60
no shutdown
exit

# SW 1, 2, 3
en
conf t

int f0/1
switchport mode access
switchport access vlan 30
no shutdown
exit


# SW 3
en
conf t

int f0/4
switchport mode access
switchport access vlan 50
no shutdown
exit

int f0/5
switchport mode access
switchport access vlan 40
no shutdown
exit


# D2

en
conf t

int range g1/0/6 - 7
switchport mode access
switchport access vlan 70
no shutdown
exit


# D3

en
conf t

int range g1/0/6 - 8
switchport mode access
switchport access vlan 70
no shutdown
exit

# 6. Configurar access trunk entre switches

# D1 -
en
conf t

int g1/0/1
switchport mode trunk
switchport trunk allowed vlan all
no shutdown
exit

# SW 1, 2, 3 -

en
conf t

int range g0/1 - 2
switchport mode trunk
switchport trunk allowed vlan all
no shutdown
exit

# D2, D3

en
conf t

int range g1/0/1 - 5
switchport mode trunk
switchport trunk allowed vlan all
no shutdown
exit


# Switch core
# conexion con los otros swithces pero no con el router
en
conf t

int range g1/0/2 - 4
switchport mode trunk
switchport trunk allowed vlan all
no shutdown
exit


# 7 configurar vlan con ip en core CHECKPOINT
#  revisar comando para cada sede "AGREGAR VLAN IP A CORE"

# 8 Configurar Router on Stick

# 9 configuracion entre routers

# Configuracion del router frontera
# En este caso es Lima
