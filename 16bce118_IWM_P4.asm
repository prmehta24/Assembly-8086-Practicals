;insertion sort         
;https://www.geeksforgeeks.org/insertion-sort/
data segment
	  a3 db 10h,23h,1h,45h,4h ; only positive numbers
	  length dw $-a3   ;$ means current address - to find length of array
data ends
code segment
      assume cs:code,ds:data
start:
      MOV AX,data ;move starting address through AX to DS(Data Segment) Register - direct transfer to DS not allowed
      MOV DS,AX   ; data to DS not possible as DS is a register that cannot access memory(data)
      mov si,1
      mov di,0
      lea bx,a3
            
      outloop:
      cmp si, length
      je done      
      
      mov di,si
      dec di
      mov dl,[bx+si]  
      
      inloop:   
      cmp di,0
      jl inloopdone
      mov dh,[bx+di]
      cmp dh,dl
      jle inloopdone   
      mov [bx+di+1],dh
      dec di   
      jmp inloop
      
          
      
      inloopdone: 
      mov [bx+di+1],dl
      inc si
      jmp outloop 
      
      done:
code ends
end start
