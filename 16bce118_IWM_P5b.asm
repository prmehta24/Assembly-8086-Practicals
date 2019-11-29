;Find the number of 1’s of given 8 bit number determine its parity and display the result.
data segment  
    no db 10101011b;    
data ends
code segment
    assume cs:code,ds:data
start:              
    mov AX,data;transfer data to AX
    mov dx,0h;count variable for number of 1s
    mov cx,8;looping variable - 8 times for 8 bits
    loop1:
    rol AX,1;shift bits MSB to LSB, bit is also copied to CF
    jnc two; if CF is 0, jump
    inc dx; if CF is 1, do not jump, but increment count
    two:
    loop loop1; return to start of loop
    and dx,00000001b ; to find parity bit - if odd then 1, if even then 0
code ends
end start