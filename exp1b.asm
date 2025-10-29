; Develop an ALP using 8086 microprocessor for subtraction of 16/32 bit numbers.
data segment
n1 dw 5678h
n2 dw 1234h
diff dw ?
data ends
code segment
Assume cs:code,DS:data
start:
mvo ax,data ; loads base address of data segment in ax register
mov ds,ax   ; copies base address of data segment from ax register into ds register 
mov ax,n1   ; copies first 16 bit number into accumulator 
mov bx,n2   ; copies second 16 bit number into bx register
sub ax,bx   ; perform 16 bit subtraction and find result in ax
mov diff, ax ; copies result of 16 bit subtraction from register ax into variable
mov ah,4ch  ; loads function value 4ch into register ah for dos interrupt
int 21h     ; it is dos interrupt which will terminate the program with dos 
code ends   ; end of code segment
end start   ; end of program