.model small
.stack 100h

.data
a dw 10
b dw 12
sum db ?
rem db ?
rem2 db ?

.code
main proc
    
    mov ax,@data 
    mov ds,ax
    
    mov ax,a
    mul b
   
    mov ah,0
    mov bl,10
    div bl
    mov sum,ah
    mov bx,ax
    
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h  
    
    mov dl,sum
    add dl,48
    mov ah,2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
end main
    
    
    
    
    

