;MUSHFIQ SHAHRIER SHAFI
;STUDENT ID: 190212

.MODEL SMALL
.STACK 100H
.DATA
    APPR1 DB 10,13,"YEAH! BABY. RIGHT GUESS $"
    APPR2 DB 10,13,"DUMB BABY. WRONG GUESS $" 
    
    P DB "ENTER NUMBER1: $"
    Q DB 10,13,"ENTER NUMBER2: $"
    R DB 10,13,"ENTER NUMBER3: $" 
    
    SUM DB 10,13,"SUMMATION IS: $"
    RES DB 10,13,"DIFFERENCE IS: $"    
    
    SHAFI DB ?
    NAFI DB ?
    KAFI DB ?
    
    GAFRI DB ?
    
    RASE DB ? 
    RAME DB ?
    
    BORO DB ?
    CHOTO DB ?

.CODE
MAIN PROC    
    
    MOV AX,@DATA 
    MOV DS,AX
    
    MOV AH,9 
    LEA DX,P
    INT 21H 
    
    MOV AH,1 
    INT 21H
    SUB AL,48
    MOV SHAFI,AL
    
    
    MOV AH,9 
    LEA DX,Q
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV NAFI,AL  
    
    MOV AH,9 
    LEA DX,R
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV KAFI,AL 
    
    LEVEL1:
    
    MOV AL,SHAFI
    CMP AL,NAFI
    JE LEVEL2 
    JMP MISSION2
    
    LEVEL2:
    MOV AL,KAFI
    CMP AL,SHAFI
    JE MISSION1
    JMP MISSION2
    
    MISSION1:
    
    MOV AL,SHAFI
    ADD AL,NAFI
    ADD AL,KAFI
    MOV GAFRI,AL
    
    MOV AH,0
    MOV BL,10
    DIV BL
    MOV RAME,AH
    MOV RASE,AL
    
    MOV AH,9 
    LEA DX,SUM
    INT 21H 
    
    
    MOV AH,2
    MOV DL,RASE
    ADD DL,48
    INT 21H
    
    MOV AH,2
    MOV DL,RAME
    ADD DL,48
    INT 21H
    
    JMP EXIT
    
    
    MISSION2:
    
    MOV AL,SHAFI
    CMP AL,NAFI
    JGE CURRENCY1
    JMP CURRENCY2
    
    CURRENCY1:
    
    MOV AL,KAFI
    CMP AL,SHAFI
    JGE BOROBHAI
    MOV BL,SHAFI
    MOV BORO,BL
    JMP MISSION3
    
    CURRENCY2:
    
    MOV AL,KAFI
    CMP AL,NAFI
    JGE BOROBHAI 
    MOV BL,NAFI
    MOV BORO,BL
    JMP MISSION3
    
    BOROBHAI:
    
    MOV AL,KAFI
    MOV BORO,AL
    
    JMP MISSION3
    
            
    MISSION3:
    
    MOV AL,SHAFI
    CMP AL,NAFI
    JLE CURRENCY3
    JMP CURRENCY4
    
    CURRENCY3:
    
    MOV AL,KAFI
    CMP AL,SHAFI
    JLE CHOTOBHAI
    MOV BL,SHAFI
    MOV CHOTO,BL
    JMP RESULT
    
    CURRENCY4:
    
    MOV AL,KAFI
    CMP AL,NAFI
    JLE CHOTOBHAI 
    MOV BL,NAFI
    MOV CHOTO,BL
    JMP RESULT
    
    CHOTOBHAI:
    
    MOV AL,KAFI
    MOV CHOTO,AL
    

    
    RESULT:
    MOV AH,9 
    LEA DX,RES
    INT 21H 
   
    MOV AL,BORO
    SUB AL,CHOTO
    
    MOV DL,AL
    ADD DL,48
    MOV AH,2
    INT 21H
    
    
    EXIT:      
    MOV AX,4C00H
    INT 21H
    MAIN ENDP

END MAIN
    
    
    