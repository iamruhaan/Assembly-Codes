; Develop ALP using 8086 microprocessor for 8 bit multiplication.
data segment
mnd db 04h
mr db 03h
product dw ?
data ends
code segment
Assume cs:code,DS:data
start:
mov ax,data ; loads base address of data segment in ax register
mov ds,ax   ; copies base address of data segment from ax register into ds register
mov al,mnd  ; copies first 8 bit number into accumulator 
mov bl,mr   ; copies second 8 bit number into bx register
mul bl      ; perform 8 bit multiplication and find result in ax
mov product, ax ; copies result of 8 bit multiplication from register ax into variable
mov ah,4ch  ; loads function value 4ch into register ah for dos interrupt
int 21h     ; it is dos interrupt which will terminate the program with dos 
code ends   ; end of code segment
end start   ; end of program