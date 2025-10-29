; Develop ALP using 8086 microprocessor for 8 bit division.
data segment
dnd db 09h
dr db 04h
quo db ?
rem db ?
data ends 
code segment
Assume cs:code,DS:data
start:
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register                                   
mov al,dnd ; copies dividend into al register
mov bl,dr ; copies divisor into bl register
div bl ; performs 8 bit division and finds quotient in al and remainder in ah
mov quo,al ; copies quotient from al register into quo variable
mov rem,ah ; copies remainder from ah register into rem variable
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos 
code ends ; end of code segment
end start ; end of program