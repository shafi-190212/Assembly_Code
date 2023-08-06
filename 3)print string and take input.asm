.model small           ;addition 
.stack 100h            ;printing msg

.data

msg1 db "Enter number 1: $"
msg2 db "Enter number 2: $"
msg3 db "Sum is: $"
num1 db 0
num2 db 0
sum db 0
rem db 0

.code 
main proc
    
     mov ax,@data
     mov ds,ax   
     
     mov ah,9               ;print msg1
     mov dx,offset msg1
     int 21h
     
     mov ah,1
     int 21h                ;input no1
     sub al,48              ;subtract 48
     mov num1,al 
     
     mov ah,2
     mov dl,10
     int 21h                ;print newline
     mov dl,13              ;print carrage return
     int 21h
     
     mov ah,9
     mov dx,offset msg2     ;print msg2
     int 21h  
     
     mov ah,1               ;input no2
     int 21h                ;sub 48
     sub al,48
     mov num2,al  
     
     mov ah,9
     mov dx,offset msg3     ;print msg3
     int 21h
             
     mov dl,num1
     add dl,num2            ;addition
     mov sum,dl
     
     mov ah,0           ;clear ah to use remainder
     mov al,sum
     mov bl,10          ;take bl=10
     div bl
     mov rem,ah         ; ah 0 chilo kintu ekhon
                        ;value ache div bl er pore
      
     mov dl,al
     add dl,48          ;1st digit print(vagfol)
     mov ah,2
     int 21h
     
     
     mov dl,rem
     add dl,48          ;2nd digit print (vagshesh)
     mov ah,2
     int 21h
     
     mov ax, 4c00h
     int 21h
     
     main endp
end main
    
        
   