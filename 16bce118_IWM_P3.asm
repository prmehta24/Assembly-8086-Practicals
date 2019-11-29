;Find maximum value in array
data segment
	  a3 db 10,23,1,45,4 ; only positive numbers
	  length db 5   ;$ means current address - to find length of array
data ends
code segment
      assume cs:code,ds:data
start:
      MOV AX,data ;move starting address through AX to DS(Data Segment) Register - direct transfer to DS not allowed
      MOV DS,AX   ; data to DS not possible as DS is a register that cannot access memory(data)
      mov si,0   ;source index register - used for looping
      lea bx,a3  ;load effective address
      mov dl,[bx+si] ;dl stores current max value, [] means base index addressing mode
      mov cl,length   ;cl stores number of loops left - length of array
      dec cl         ; decrement 1 as we already evaluated first value in array
      inc si         ; increase index to access next value in array
      
      label:
          mov al,[bx+si] ;al stores current value of array being compared
          cmp dl,al ; if dl>al carry flag=0, else carry flag=1 - carry flag=cf  
          inc si    ; after comparing always increment index to compare next value in array on next iteration
          jnc label2; checks carry flag as condition for jumping. if cf=0 then jump, else go to next line
          mov dl,al ; if cf=1, then dl<al so make al new max value
      label2:          
      loop label ; loop will only work if cl>0, also on executing this command cl is decremented.    
                 ; Thus, loop is not executed when cl=0 which means that the last value of array has been reached
code ends
end start
