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
