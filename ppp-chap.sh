# Router Lima - Ica
# Lima
en
conf t
username Router_Ica password cisco


int s0/0/1
encapsulation ppp
ppp authentication chap
no shutdown
exit

exit

# Ica
en
conf t

username Router_Lima password cisco
interface s0/0/0
encapsulation ppp
ppp authentication chap
no shutdown
exit
