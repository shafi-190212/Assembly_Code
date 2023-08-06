.model small
.stack 100h

.code 
     
main proc
    
     ;taking input
        
     mov ah,1
     int 21h
     mov bl,al 
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 

     mov ah,1
     int 21h
     mov bh,al 
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     
     ;printing output
     
     mov ah,2
     mov dl,bl
     int 21h 
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     mov ah,2
     mov dl,bh
     int 21h
     
     mov ax,4c00h
     int 21h
           
           
     main endp
end main
     





