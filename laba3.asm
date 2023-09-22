;var 7
.model tiny

org 100h

.data
a dd 6 ; Initialize 
b dd 10 ; Initialize  
x db ?   ; Declare variable x as an uninitialized byte.

.code
mov ax,[a]     ; Move a into AX register.
mov bx,[b]     ; Move b into BX register.       
cmp ax, bx     ; Compare a and b, setting flags accordingly.
jg greater_than    ; Jump to label 'greater_than' if a > b (i.e., jump on 'greater' flag).
jl less_than       ; Jump to label 'less_than' if a < b (i.e., jump on 'less than' flag).
mov al,-125        ; Set AL register equal to -125 if a = b.
mov [x],al
jmp short exit_program

greater_than:   
mov dx,bx
mov bx,ax
mov ax,dx
mov cx, 52       ; Move 52 into CX register.
imul cx          ; Multiply AX by CX (AX = AX * CX = 52 * b)
xor dx, dx       ; Clear DX for division.
div bx           ; AX/BX
add ax, [b]      ; AX = AX + b
mov [x],al      ; Move AX into variable x.
JMP short exit_program ; 

jmp short exit_program

less_than:
sub ax,5
idiv bx
mov [x],al

exit_program:
ret
