$MOD51
jmp start
org 0bh
clr TCON.4
reti
org 20h

start:
clr C
mov TMOD,#01h
setb IE.7
setb IE.1
mov P2,#0h

Period:
mov A,#0h
mov TL0,#50h
mov TH0,#0FFh
mov P2,A
setb TCON.5

next1:
jnb TCON.5, next1
mov A,#80h
mov TL0,#12h
mov TH0,#0FFh
mov P2,A
setb TCON.4

next2:
add A,#2h
mov P2,A
jnb TCON.5,next2
mov A, #0FFh
mov TL0,#12h
mov TH0,#0FFh
mov P2,A
setb TCON.4

next3:
add A,#0h 
mov P2,A
jnb TCON.5,next3
mov A, #0FFh 
mov TL0,#0FFh
mov TH0,#0FFh
mov P2,A
setb TCON.4

next4:
jnb TCON.5, next4
mov A,#47h
mov TL0,#12h
mov TH0,#0FFh
mov P2,A
setb TCON.4

next5:
add A,#3h
mov P2,A
jnb TCON.5,next5
mov TL0,#12h
mov TH0,#0FFh
setb TCON.4

next6:
mov A,#0h 
mov TL0,#12h
mov TH0,#0FFh
mov P2,A
setb TCON.4

next7:
jnb TCON.5,next7
clr C
jmp Period 

END