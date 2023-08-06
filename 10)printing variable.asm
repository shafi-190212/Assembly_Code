.model small
.stack 100h

.data
num1 db 3
num2 db ?

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,2
    add num1,48 
    mov dl,num1
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,1
    int 21h
    mov num2,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,num2
    int 21h
    
    mov ax,4c00h
    int 21h
    
    main endp
end main