.model small         ;ans 3 digit er ashbe
.stack 100h

.data
a dw 99
b dw 99
c dw 30
d dw 11
sum db ?
rem db ?
rem2 db ?

.code
main proc
    
    mov ax,@data 
    mov ds,ax
    
    mov ax,a
    add ax,b          ;addition
    add ax,c
    add ax,d
   
    
    mov ah,0          ;result ke 10 diye vag
    mov bl,10
    div bl
    mov sum,ah        ;vagshesh ah ke sum e neya
    mov bx,ax
    
    mov ah,0
    mov bl,10         ;2nd digit er jonno abar 10 diye vag
    div bl
    mov rem,ah        ;vagshesh ah ke rem e neya
    
    mov dl,al
    add dl,48         ;1st ligit-al
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48         ;2nd digit-rem
    mov ah,2
    int 21h  
    
    mov dl,sum
    add dl,48         ;3rd digit-sum
    mov ah,2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
end main
    
    
    
    
    

