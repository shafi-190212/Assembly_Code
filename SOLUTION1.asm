.MODEL SMALL
.STACK 100H

.DATA

 NAFI DB ?
 SHAFI DB ?
 
.CODE
MAIN PROC
    
    MOV AH,2
    MOV DL,48
    INT 21H 
    
    
    MOV AH,2
    MOV BL,2
    MOV DL,BL 
    ADD DL,48
    INT 21H 
    
    
    MISSION1: 
    
    MOV AH,2
    MOV DL,32 
    INT 21H
    
    INC BL
    INC BL 
    
    
    MOV AH,0
    MOV AL,BL
    MOV CL,10
    DIV CL
    MOV NAFI,AH
    MOV SHAFI,AL 
    
    MOV AH,2
    MOV DL,SHAFI      
    ADD DL,48
    INT 21H
    
    MOV AH,2 
    MOV DL,NAFI      
    ADD DL,48
    INT 21H
       
    CMP BL,14
    JL MISSION1
    JMP EXIT
    
    EXIT:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP

END MAIN