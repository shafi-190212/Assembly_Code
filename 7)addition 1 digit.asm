.model small        ;addition:1 digit
.stack 100h

.data
a dw 2
b dw 3
sum dw ?

.code
main proc
      
    mov ax,@data
    mov ds,ax 
    
    mov ax,a
    add ax,b
    mov sum,ax 
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
    mov ax,4c00h
    int 21h
    
    main endp
end main
     
    
    
    
    