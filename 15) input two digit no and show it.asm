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
    
    
    
    
    
    mov cl,al    ; cl=2         ; cl=3
    mov al,bl    ; al=0         ; al=2
    
    mul dl       ; al=0*10=0    ; al=2*10=20
    
    add al,cl    ; al=0+2=2     ; al=20+3
    mov bl,al    ; bl=2         ; bl=23
    mov myres,bl ; myres=2      ; myres=23
                
                
                
                
                
                
                
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
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h 
    
    
           
    mov ah,04ch
    int 21h
    
    main endp
end main