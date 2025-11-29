# 1. Asignacion de ip PARA EL GRUPO 2  fue     103.24.158.0/24
# 2. conexion de switch con vlan

# ISP1 -> ISP3
ip route 103.24.158.0 255.255.255.0 219.0.0.5
# ISP2 -> ISP3
ip route 103.24.158.0 255.255.255.0 219.0.0.9


# isp 3 -> isp 1
ip route 0.0.0.0 0.0.0.0 219.0.0.6
# isp 3 -> isp 2
ip route 0.0.0.0 0.0.0.0 219.0.0.10
