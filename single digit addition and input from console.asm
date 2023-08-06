.model small
.stack 100h

.data
a db ?
b db ?
rem db ?

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al
    
    mov ah,1
    int 21h
    sub al,48
    mov b,al
    
    mov al,a
    add al,b
    
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
    
    mov ah,2
    mov dl,rem
    add dl,48
    int 21h
    
    
    mov ax,4c00h
    int 21h
    
    main endp
end main