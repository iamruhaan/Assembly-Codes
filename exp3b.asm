; Develop ALP using 8086 microprocessor for 16 bit division.
data segment
dndlw dw 0063h
dndhw dw 0626h
dr dw 1234h
quo dw ?
rem dw ?
data ends
code segment
Assume cs:code,DS:data
start:
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov ax,dndlw ; copies lower word of dividend into ax register
mov dx,dndhw ; copies higher word of dividend into dx register
mov bx,dr ; copies divisor into bx register
div bx ; performs 16 bit division and finds quotient in ax and remainder in dx
mov quo,ax ; copies quotient from ax register into quo variable
mov rem,dx ; copies remainder from dx register into rem variable
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos 
code ends ; end of code segment
end start ; end of program