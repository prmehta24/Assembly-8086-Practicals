;Perform binary arithmetic operations on two 32 bit numbers.
data segment          ;dw is 16-bit word
     a1 dw 0FFFFh     ;lower part of a
	 a2 dw 0001h      ;higher part of a (more significant)
	 b1 dw 0001h     ;lower part of b
	 b2 dw 0002h      ;higher part of b (more significant)
data ends
code segment 
     assume cs:code,ds:data
start:
     MOV AX,data
     MOV DS,AX
     MOV AX,a1 ;addition of lower parts
     add AX,b1
     MOV BX,a2 ;addition of higher parts and carry from lower part addition
     adc BX,b2
code ends
end start
