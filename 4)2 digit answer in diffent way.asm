.model small
.stack 100h

.data

msg1 db "Enter number 1: $"
msg2 db "Enter number 2: $"
msg3 db "Sum is: $"
num1 db 0
num2 db 0
sum db 0
rem db 0

.code 
main proc
    
     mov ax,@data
     mov ds,ax   
     
     mov ah,9
     mov dx,offset msg1
     int 21h
     
     mov ah,1
     int 21h 
     sub al,48
     mov num1,al 
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     mov ah,9
     mov dx,offset msg2
     int 21h  
     
     mov ah,1
     int 21h 
     sub al,48
     mov num2,al  
     
     mov ah,9
     mov dx,offset msg3
     int 21h
             
     mov dl,num1
     add dl,num2
     mov sum,dl
     
     mov ah,0
     mov al,sum
     mov bl,10
     div bl
     mov rem,ah
       
     mov bx,ax
      
     mov dl,bl
     add dl,48
     mov ah,2
     int 21h
     
     
     mov dl,bh
     add dl,48
     mov ah,2
     int 21h
     
     mov ax, 4c00h
     int 21h
     
     main endp
end main
    
        
   