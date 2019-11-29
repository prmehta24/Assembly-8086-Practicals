;To perform addition, subtraction, or, and, not
code segment
start:
    mov AX,0AABH
    mov BX,000BH
    add AX,BX 
    sub AX,BX
    or AX,BX
    and AX,BX
    not AX
    
code ends
end start