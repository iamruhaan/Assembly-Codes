; Program to count number of ODD & EVEN element of array
data segment
array db 2h, 4h, 5h, 11h, 10h ; array with 5 bytes data 2h, 4h, 5h, 11h, 10h
oddent db ? ; variable to store number of odd elements
evenent db ? ; variable to store number of even elements
data ends ; data segment
code segment ; code segment
Assume cs:code,DS:data ; assume code segment and data segment
start: ; start of program
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov cx,05h ; copies 05h into cx register
lea si,array ; loads effective address of array into si register
next: ; loop label
mov al,[si] ; copies byte from array to al register
ror al,01h ; rotate al register right by 1 bit
jnc even ; jump to even label if carry flag is not set
inc dl ; increment dl register
jmp ahead ; jump to ahead label
even: ; even label
inc dh ; increment dh register
mov oddent,dl ; copies value of dl register into oddent variable
mov evenent,dh ; copies value of dh register into evenent variable
ahead: ; ahead label
inc si ; increment si register
loop next ; loop back to next label if cx register is not zero
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos exit status
code ends ; end of code segment
end start ; end of program