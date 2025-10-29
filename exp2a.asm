; Develop ALP using 8086 microprocessor for 32 bit addition.
data segment
n1hw dw 1234h
n2lw dw 5678h
n2hw dw 2253h
n2lw dw 5132h
sumhw dw ?
sumlw dw ?
data ends
code segment
Assume cs:code,DS:data
start:
mov ax,data ; loads base address of data segment in ax register
mov ds,ax   ; copies base address of data segment from ax register into ds register
mov ax,n1hw ; copies first 16 bit number into accumulator 
mov bx,n1lw ; copies second 16 bit number into bx register
mov cx,n2hw ; copies third 16 bit number into cx register
mov dx,n2lw ; copies fourth 16 bit number into dx register
add bx,dx   ; perform 16 bit addition and find result in bx
mov sumlw,bx ; copies result of 16 bit addition from register bx into variable
adc ax,cx   ; perform 16 bit addition and find result in ax
mov sumhw,ax ; copies result of 16 bit addition from register ax into variable
mov ah,4ch  ; loads function value 4ch into register ah for dos interrupt
int 21h     ; it is dos interrupt which will terminate the program with dos 
code ends   ; end of code segment
end start   ; end of program