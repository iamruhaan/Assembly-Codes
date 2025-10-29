; Develop ALP using 8086 microprocessor for 8 bit division using unpacked BCD.
data segment
n1 db 07h
n2 db 05h
ascii db ?
data ends
code segment
Assume cs:code,DS:data
start:
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov al,n1 ; copies first 8 bit number into al register
mov bl,n2 ; copies second 8 bit number into bl register
add al,bl ; adds the two numbers and stores the result in al register
mov ah,00h ; clears ah register
aaa ; adjust al for unpacked BCD
or ax,3030h ; convert to ASCII
mov ascii,ax ; copies the result from ax register into ascii variable
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos 
code ends ; end of code segment
end start ; end of program