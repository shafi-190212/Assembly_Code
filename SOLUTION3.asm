;MUSHFIQ SHAHRIER SHAFI
;STUDENT ID: 190212

.MODEL SMALL
.STACK 100H
.DATA
    APPR1 DB 10,13,"YEAH! BABY. RIGHT GUESS $"
    APPR2 DB 10,13,"DUMB BABY. WRONG GUESS $" 
    P DB "ENTER A CHARACTER: $"
    Q DB 10,13,"GUESS BABY: $"
    SHAFI DB ?
    NAFI DB ?

.CODE
MAIN PROC    
    
    MOV AX,@DATA 
    MOV DS,AX
    
    MOV AH,9 
    LEA DX,P
    INT 21H 
    
    MOV AH,1 
    INT 21H
    MOV SHAFI,AL
    
    
    MOV AH,9 
    LEA DX,Q
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NAFI,AL 
    
    SUB AL,SHAFI
    
    CMP AL,4
    JE MISSION1
    JMP MISSION2
    
    
    MISSION1:
    
    LEA DX,APPR1
    MOV AH,9
    INT 21H
    JMP EXIT
    
    MISSION2:
    
    LEA DX,APPR2
    MOV AH,9
    INT 21H
    JMP EXIT
        
    
    EXIT:
    
    MOV AX,4C00H
    INT 21H
    MAIN ENDP

END MAIN
    
    
    