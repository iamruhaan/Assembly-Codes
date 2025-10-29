; Write an ALP to display your name on a screen of the computer (the name should be printed 5 times)
data segment
msg db 0dh, 0ah, 'Ruhaan $'
data ends ; data segment
code segment ; code segment
Assume cs:code,DS:data ; assume code segment and data segment
start: ; start of program
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov cx,05h ; copies 05h into cx register
lea dx,msg ; loads effective address of msg into dx register
back: ; loop label
mov ah,09h ; loads function value 09h into register ah for display string
int 21h ; it is dos interrupt which will terminate the program with dos exit status
loop back ; loop back to back label if cx register is not zero
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos exit status
code ends ; end of code segment 
end start ; end of program