.MODEL SMALL
.STACK 100H
.DATA
    first dw 5618h, 6234h
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
        MOV DX,first[SI]
        SBB DX,second[SI]
        MOV result[SI],DX
        INC SI
        INC SI
        LOOP ARR
 
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
            CMP DL,39H
            JBE L3
            ADD DL,07H
            L3:
                MOV AH,02H       
                INT 21H        
                LOOP OUTPUT
        MOV CX,temp
        DEC temp
    LOOP L2


.EXIT
END

