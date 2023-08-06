.model small         ;addition
.stack 100h          ;ans 2 digit er ashbe

.data
a dw 0400h
b dw 9
sum dw ?
rem db ?


.code
main proc  
     mov ax,@data
     mov ds,ax
     
     mov ax,a           ;addition
     
     mov ah,0           ; 10 diye divide
     mov bl,10h
     div bl
     mov rem,ah
     
     mov dl,al
     add dl,48          ;result print(1st digit) 
     mov ah,2
     int 21h
     
     mov dl,rem 
     add dl,48          ;rem print (2nd digit)
     mov ah,2
     int 21h
     
     mov ax,4c00h
     int 21h
     
     main endp
end main
     