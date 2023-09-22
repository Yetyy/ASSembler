;var 7: (2*c-d/4)/(a*a+1)
;include 'emu8086.inc'
.model tiny 
org 100h

.data
a dw 1
c dw 4
d dw 8
result dd ?

.code
mov ax, [a]
imul ax
mov bx, ax ; BX = a^2

mov ax, 1
add bx, ax ; BX = a^2 + 1

mov ax, [c]
add ax, ax ; AX = 2*c

mov bx, [d]
shr bx, 2 ; BX = d/4

sub ax, bx ; AX = 2*c - d/4

cwd ; Extend AX into DX:AX

div bx ; DX:AX = (2*c - d/4)/(a^2)

mov [result], ax

ret
