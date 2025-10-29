; Develop ALP using 8086 microprocessor for block transfer without using string instructions.
data segment
src blk db 20h,21h,22h,23h,24h ; source block with 5 bytes data 20h,21h,22h,23h,24h
dst blk db 5 dup(?) ; destination block with 5 bytes data 5 dup(?) 
data ends ; data segment
code segment ; code segment
Assume cs:code,DS:data
start: ; start of program
mov ax,data ; loads base address of data segment in ax register
mov ds,ax ; copies base address of data segment from ax register into ds register
mov es,ax ; copies base address of data segment from ax register into es register
lea bx,src blk ; loads effective address of source block into bx register
lea bp,dst blk ; loads effective address of destination block into bp register
mov cx,0005h ; copies 0005h into cx register
back: ; loop label
mov al,ds:[bx] ; copies byte from source block to al register
mov es:[bp],al ; copies byte from al register to destination block
inc bx ; increments bx register
inc bp ; increments bp register
loop back ; loops back to back label if cx register is not zero
mov ah,4ch ; loads function value 4ch into register ah for dos interrupt
int 21h ; it is dos interrupt which will terminate the program with dos exit status
code ends ; end of code segment
end start ; end of program      