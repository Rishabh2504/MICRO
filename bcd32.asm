.MODEL SMALL
.STACK 100H
.DATA
    first dw 5678h, 1234h
    second dw 5678h, 1234h
    result dw 2 dup(0)
    temp dw ?
    msg db "Result: $", 10
.CODE
.STARTUP 
    MOV SI,0
    MOV DX,offset msg
    MOV AH,09H
    INT 21H
    CLC

    MOV CX,2
    ARR:
        MOV AX,first[SI]
        MOV BX,second[SI]
        ADC AL,BL
        DAA
        ADC AH,BH
        MOV BL,AL
        MOV AL,AH
        DAA
        MOV BH,AL
        MOV result[SI],BX
        INC SI
        INC SI
        LOOP ARR

        JNC L1
        MOV DL,31H
        MOV AH,02H
        INT 21H



    
    L1:
        MOV CX,2
        MOV temp,CX

    L2:
        DEC SI
        DEC SI
        MOV BX,result[SI]
        MOV CX, 4
        OUTPUT: 
            ROL BX, 4
            MOV DL,BL 
            AND DL,0FH
            ADD DL,30H
            MOV AH,02H       
            INT 21H        
            LOOP OUTPUT
        MOV CX,temp
        DEC temp
    LOOP L2


.EXIT
END

