.model small
.stack 100h

.data
myres db ?
rem db 0

.code
main proc
    
    mov ax,@data
    mov ds,ax  
    
    mov dl,10
    mov bl,0
    
    scanNum:
    
    
    mov ah,1
    int 21h
    
    cmp al,13
    je exit
    
    mov ah,0
    sub al,48
    
    mov cl,al
    mov al,bl
    
    mul dl
    
    add al,cl
    mov bl,al
    mov myres,bl
    
    jmp scanNum
    
    
    exit:
    
    mov dl,10
    mov ah,2
    int 21h
    
    
    mov ah,0
    mov dl,0
    mov bl,0
    
    mov al,myres
    
    mov bl,10
    
    div bl
    mov rem,ah
    
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov ah,04ch
    int 21h
    
    main endp
end main
