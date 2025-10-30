; Develop ALP to reverse user entered string
data segment
msg db 0dh, 0ah, 'Enter a string: $'
revmsg db 0dh, 0ah, 'Reversed string: $'
arr db 5 dup (00h) ; array with 5 bytes data 00h
rev db 5 dup (00h) ; array with 5 bytes data 00h
data ends ; data segment
code segment ; code segment
Assume cs:code,DS:data ; assume code segment and data segment
start: ; start of program
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov es,ax ; copies base address of data segment from ax register into es register
mov cx,0005h ; copies 0005h into cx register
lea bx,arr ; loads effective address of arr into bx register
lea dx,msg ; loads effective address of msg into dx register
mov ah,09h ; loads function value 09h into register ah for display string
int 21h ; it is dos interrupt which will terminate the program with dos exit status
back:
mov ah,01h ; loads function value 01h into register ah for read string
int 21h ; it is dos interrupt which will terminate the program with dos exit status
inc bx ; increment bx register
loop back ; loop back to back label if cx register is not zero
mov cx,0005h ; copies 0005h into cx register
lea si,arr ; loads effective address of arr into si register
lea di,rev ; loads effective address of rev into di register
add di,0004h ; add 0004h to di register
cld ; clear direction flag
nextchar:
mov sb 
dec si ; decrement si register
dec di ; decrement di register
loop nextchar ; loop back to nextchar label if cx register is not zero
lea dx,revmsg ; loads effective address of revmsg into dx register
mov ah,09h ; loads function value 09h into register ah for display string
int 21h ; it is dos interrupt which will terminate the program with dos exit status
mov cx,00h ; copies 00h into cx register
lea dx,rev ; loads effective address of rev into dx register
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos exit status
code ends ; end of code segment
end start ; end of program