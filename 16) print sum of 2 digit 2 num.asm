.model small
.stack 100h

.data
m1 db "Enter first number: $"
m2 db 10,13,"Enter second number: $"
m3 db 10,13,"Result is: $"
myres1 db ?
myres2 db ?
summation db ?
rem1 db 0
rem2 db 0 
rem3 db 0

.code
main proc
    
    mov ax,@data
    mov ds,ax  

    mov ah,9
    lea dx,m1        ;print m1
    int 21h 
    
    mov dl,10
    mov bl,0
    
    level1: 
    
    mov ah,1
    int 21h
    
    cmp al,13
    je exit1
    
    mov ah,0
    sub al,48
    
    mov cl,al
    mov al,bl
    
    mul dl
    
    add al,cl
    mov bl,al
    mov myres1,bl
    
    jmp level1 
    
    
    
    
    level2: 
    
   
    mov ah,9
    lea dx,m2        ;print m2
    int 21h
    
    mov dl,10
    mov bl,0
    jmp level
    
    level: 
    
     
    mov ah,1
    int 21h
    
    cmp al,13
    je exit2
    
    mov ah,0
    sub al,48
    
    mov cl,al
    mov al,bl
    
    mul dl
    
    add al,cl
    mov bl,al                
    mov myres2,bl
    
    jmp level
    
    
    exit1:  
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    int 21h
    
    mov ah,0
    mov dl,0
   
    
    mov al,myres1
    
    mov bl,10
    
    div bl
    mov rem1,ah
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem1
    add dl,48
    mov ah,2
    int 21h 
    
    
    jmp level2   
    
         
    exit2:     
         
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    int 21h
    
    mov ah,0
    mov dl,0
    mov bl,0
    
    mov al,myres2
    
    mov bl,10
    
    div bl
    mov rem2,ah
    
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem2
    add dl,48
    mov ah,2
    int 21h 
    
    jmp sum
    
    sum:
    
    mov bh,myres1
    add bh,myres2
    mov summation,bh 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,m3        ;print m3
    int 21h 
            
    mov ah,0
    mov dl,0
    mov bl,0
    
    mov al,summation
    
    mov bl,10
    
    div bl
    mov rem3,ah
    
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem3
    add dl,48
    mov ah,2
    int 21h 
    
    
    
    
           
    mov ah,04ch
    int 21h
    
    main endp
end main
    
    
    

    