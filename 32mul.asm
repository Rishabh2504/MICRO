.MODEL SMALL
.STACK 100H
.DATA
    first dw 2521H,3206H
    second dw 0A26H,6400H
    result dw 4 dup(0)
    tempcount dw ?
    msg db "result: $", 10

.CODE
    .STARTUP
    MOV DX,offset msg 
    MOV AH, 09H
    INT 21H

    MOV AX, first[0H]
    MUL second[0H]

    MOV result[2H], DX
    MOV result[0H], AX

    MOV AX, first[0H]
    MUL second[2H]  
    MOV result[4H], DX
    ADD result[2H], AX
    ADC result[4H], 0H

    MOV AX, first[2H]
    MUL second[0H]
    ADD result[2H], AX
    ADC result[4H], DX
    ADC result[6H], 0H

    MOV AX, first[2H]
    MUL second[2H]
    ADD result[4H], AX
    ADC result[6H], DX

    MOV CX,4
    MOV tempcount,CX
    MOV SI,6

    L1:
        MOV BX,result[SI]
        MOV CX, 4
        OUTPUT: 
            ROL BX, 4
            MOV DL,BL 
            AND DL,0FH
            ADD DL,30H
            CMP DL,39H
            JBE L2
            ADD DL,07H
            L2:
                MOV AH,02H       
                INT 21H        
                LOOP OUTPUT
        DEC SI
        DEC SI
        MOV CX,tempcount
        DEC tempcount
    LOOP L1
    .EXIT
END

