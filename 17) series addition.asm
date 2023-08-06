.model small
.stack 100h

.data
a db 1 
final db ?
sum db 0

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    sub al,48
    mov final,al
    
    
    mov cl,a 
    
    level: 
    
    mov bl,sum
    add bl,cl
     
    mov sum,bl
    
    
    mov bh,final
    cmp bh,cl
    je exit 
    inc cl
    jmp level
   
    exit:
    
    mov ah,2
    add sum,48
    mov dl,sum
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp

end main
    
    
     
    
    
    





