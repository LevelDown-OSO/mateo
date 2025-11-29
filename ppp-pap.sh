# isp1 - Lima
# isp1
en
conf t
username Router_Lima password cisco

interface s0/2/0

ppp authentication pap

ppp pap sent-username ISP1 password cisco

exit
# Lima

enable
configure terminal

username ISP1 password cisco

interface s0/0/0

ppp authentication pap

ppp pap sent-username Router_Lima password cisco

end
# COMPLETADO


# isp 2 - Lima
# isp2
en
conf t
username Router_Lima password cisco

interface s0/2/0

ppp authentication pap

ppp pap sent-username ISP2 password cisco

exit
# Lima

enable
configure terminal

! 1. Crear el usuario para el ISP (mismo password)
username ISP2 password cisco

! 2. Entrar a la interfaz conectada al ISP
interface s0/1/1

! 3. Activar la petición de autenticación PAP
ppp authentication pap

! 4. Enviar mis credenciales a ISP 1
ppp pap sent-username Router_Lima password cisco

end
# COMPLETADO


# Configuracion Lima = La Libertad

# Lima
en
conf t
username Router_LaLibertad password cisco

int s0/1/0
ppp authentication pap
ppp pap sent-username Router_Lima password cisco
exit

# La Libertad (no tiene configurado ppp)

en
conf t
username Router_Lima password cisco

int s0/0/0
encapsulation ppp
no shutdown
ppp authentication pap
ppp pap sent-username Router_LaLibertad password cisco
exit
