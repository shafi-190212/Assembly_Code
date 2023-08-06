.model small
.stack 100h

.data
    msg1 db 10,13,"Enter first number: $"
    msg2 db 10,13,"Enter second number: $"
    msg3 db 10,13,"Result is: $"
    res db ?
    a db ?
    b db ?

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,1        ;input which case
    int 21h         ;sub as it is taken input
    sub al,48
   
     
   
    cmp al,2
    je subtraction  ;compare
    jmp addition
    
     
   
         
    addition:
     
    mov ah,9        ;print msg1
    lea dx,msg1
    int 21h
    
    mov ah,1        ;input a
    int 21h
    sub al,48       ;sub as it is taken input
    mov a,al
    
    mov ah,9          
    lea dx,msg2     ;print msg2
    int 21h
    
    mov ah,1        ;input b
    int 21h
    sub al,48       ;sub as it is taken input
    mov b,al
    
    mov bl,a
    add bl,b        ;addition
    add bl,48       ;add 48
    mov res,bl
    
    
    mov ah,9        ;print msg3
    lea dx,msg3
    int 21h
    
    mov ah,2
    mov dl,res
    int 21h
    jmp exit
   
    
    subtraction:
    
    mov ah,9       ;print msg1
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h        ;input a
    sub al,48
    mov a,al

    mov ah,9          
    lea dx,msg2     ;print msg2
    int 21h
    
    mov ah,1
    int 21h         ;input b
    sub al,48
    mov b,al
    
    mov bl,a
    sub bl,b        ;subtract
    add bl,48
    mov res,bl
    
    mov ah,9        ;print msg3
    lea dx,msg3
    int 21h
    
    mov ah,2
    mov dl,res
    int 21h
    jmp exit
   
    
    exit:
    mov ax,4c00h
    int 21h
    main endp
end main
    
    