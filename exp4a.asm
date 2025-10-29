; Develop ALP using 8086 microprocessor for block transfer using string instructions.
data segment
src blk db 20h,21h,22h,23h,24h
dst blk db 5 dup(?)
data ends
code segment
Assume cs:code,DS:data
start:
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov es,ax ; copies base address of data segment from ax register into es register
lea si,src blk ; loads effective address of source block into si register         
lea di,dst blk ; loads effective address of destination block into di register
mov cx,0005h ; copies 0005h into cx register
cld ; clears direction flag (forward direction)
rep movsb ; copies 5 bytes from source block to destination block
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos exit status
code ends ; end of code segment
end start ; end of program      