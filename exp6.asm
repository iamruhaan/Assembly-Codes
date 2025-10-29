; Develop ALP to find maximum number of array
data segment ; data segment
array db 2h, 4h, 5h, 7h, 10h, 11h ; array with 6 bytes data 2h, 4h, 5h, 7h, 10h, 11h
max db ? ; variable to store maximum number
data ends ; data segment
code segment ; code segment
Assume cs:code,DS:data ; assume code segment and data segment
start: ; start of program
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov cx,04h ; copies 06h into cx register
lea si,array ; loads effective address of array into si register
mov al,[si] ; copies byte from array to al register
again: ; loop label
inc si ; increment si register
cmp al,[si] ; compare al register with byte from array
jnc next ; jump to next label if al register is greater than byte from array
mov al,[si] ; copies byte from array to al register
next: ; next label
loop again ; loop back to again label if cx register is not zero
mov max,al ; copies value of al register into max variable
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos exit status
code ends ; end of code segment
end start ; end of program