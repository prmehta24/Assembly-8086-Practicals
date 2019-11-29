;String related interrupt handling: input, display string.
data segment  
    str db 10 dup("$")   
data ends
code segment
    assume cs:code,ds:data
start:              
    mov AX,data;transfer data to AX
    mov ds,ax
    mov ah, 0ah
    lea dx,str
    int 21h
    
    MOV dl, 10;newline - https://stackoverflow.com/questions/15832893/printing-a-new-line-in-assembly-language-with-ms-dos-int-21h-system-calls
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h
    
    mov ah,09h
    lea dx, str+2
    int 21h
code ends
end start