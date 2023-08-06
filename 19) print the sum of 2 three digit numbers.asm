.model small
.stack 100h

.data
m db 10,13,"1st no:$"
n db 10,13,"2nd no:$"
p db 10,13,"3rd no:$"
myres1 db ?
myres2 db ?
summation db ?
rem1 db ?
rem11 db ?
rem2 db ?
rem22 db ?
rem3 db ?
rem4 db ?
  
.code
main proc
    
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx,m 
    int 21h
    
    mov dl,10
    mov bl,0
    
    scan1:
    
    mov ah,1
    int 21h
    
    
    cmp al,13
    je scan2
    
    mov ah,0
    sub al,48
    
    
    mov cl,al    ; cl=2
    mov al,bl    ; al=0
    mul dl       ; al=0
    
    add al,cl    ; al=2
    mov bl,al    ; bl=2 
    mov myres1,bl ; myres=2
    
    jmp scan1
    
    
    scan2:
    
    mov ah,9
    lea dx,n 
    int 21h
    
    mov dl,10
    mov bl,0
    jmp scan3
    
    scan3:
    
    mov ah,1
    int 21h
    
    
    cmp al,13
    je exit1
    
    mov ah,0
    sub al,48
    
    
    mov cl,al    ; cl=2
    mov al,bl    ; al=0
    mul dl       ; al=0
    
    add al,cl    ; al=2
    mov bl,al    ; bl=2 
    mov myres2,bl ; myres=2
    
    jmp scan3
    
    
    exit1:
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov dl,0
    mov bl,0
    mov ah,0
    
    mov al,myres1
    mov dl,10
    div dl
    mov rem1,ah
    mov dh,al 
    
    mov dl,0
    mov bl,0
    mov ah,0
    
    mov al,dh
    mov dl,10
    div dl
    mov rem11,ah
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,rem11
    add dl,48
    int 21h
    
    mov ah,2 
    mov dl,rem1
    add dl,48
    int 21h 
    
    jmp exit2   
    
    
    exit2:
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov dl,0
    mov bl,0
    mov ah,0
    
    mov al,myres2
    mov bl,10
    div bl
    mov rem2,ah
    mov dh,al 
    
    mov dl,0
    mov bl,0
    mov ah,0
    
    mov al,dh
    mov bl,10
    div bl
    mov rem22,ah
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
    
    mov ah,2 
    mov dl,rem22
    add dl,48
    int 21h
    
    mov ah,2 
    mov dl,rem2
    add dl,48
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
    lea dx,p     ;print m3
    int 21h 
            
    mov ah,0
    mov dl,0
    mov bl,0
    
    
    mov al,summation
    mov bl,10
    div bl
    mov rem3,ah
    mov dh,al
    
    mov ah,0
    mov dl,0
    mov bl,0
    
    mov al,dh
    mov bl,10
    div bl
    mov rem4,ah 
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem4
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
    