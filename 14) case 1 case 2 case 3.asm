.model small
.stack 100h

.data
text db "Enter case: 1 to add, 2 to subtract, 3 to multiply: $"
msg1 db 10,13,"Enter first number: $"
msg2 db 10,13,"Enter second number: $"
msg3 db 10,13,"Result is: $"
a db ?
b db ?
res db ?

.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,text
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    cmp al,1
    je addition
    jmp decision 
    
    
    decision:
    
    cmp al,2
    je subtraction
    jmp multiplication
    
    
    
    addition:
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov b,al
    
    mov al,a
    add al,b
    add al,48
    mov res,al 
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    mov ah,2
    mov dl,res
    int 21h
    jmp exit
    
    
    subtraction:
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov b,al
    
    mov al,a
    sub al,b
    add al,48
    mov res,al
    
    
    mov ah,9
    lea dx,msg3
    int 21h 
    
    
    mov ah,2
    mov dl,res
    int 21h
    jmp exit 
    
    
    
    multiplication:
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov b,al
    
    mov al,a
    mul b
    add al,48
    mov res,al 
    
    mov ah,9
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
    