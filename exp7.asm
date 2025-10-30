; Write ALP for sorting an array in ascending order
data segment
array db 9h, 2h, 5h, 7h, 9h
data ends ; data segment
code segment ; code segment
Assume cs:code,DS:data ; assume code segment and data segment
start: ; start of program
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov dx,04h ; copies 04h into dx register
nextscan:
mov cx,dx ; copies value of dx register into cx register
lea si,array ; loads effective address of array into si register
nextcmp:
mov al,[si] ; copies byte from array to al register
inc si ; increment si register
cmp al,[si] ; compare al register with byte from array
jc nochg ; jump to nochg label if al register is less than byte from array
xchg al,[si]; exchange al register with byte from array
dec si ; decrement si register
mov [si],al ; copies value of al register into byte from array
inc si ; increment si register
dec cx ; decrement cx register
nochg:
dec cx ; decrement cx register
jnz nextcmp ; jump to nextcmp label if cx register is not zero
dec dx ; decrement dx register
jnz nextscan ; jump to nextscan label if dx register is not zero
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos exit status
code ends ; end of code segment
end start ; end of program