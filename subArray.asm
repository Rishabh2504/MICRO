.MODEL SMALL
.STACK 100H
.DATA
A db 7,8,9,15,6
B db 3,2,5,4,6
RES db 5 dup(?)
msg1 db 'RES: $'
msg2 db ' $'
.CODE
.STARTUP 

    MOV SI,0
    MOV CX,5
    L1: MOV DL,A[SI]
        SUB DL,B[SI]
        MOV RES[SI],DL
        INC SI
        LOOP L1

    MOV SI,0

    MOV DX,offset msg1
    MOV AH,09H
    INT 21H

    MOV CX,5
    MOV BX,CX

    L2: MOV CX,2
    OUTPUT: ROL RES[SI],4   
            MOV DL,RES[SI]
            AND DL,0FH
            CMP DL,9
            JG L3
            ADD DL,30H
            JMP L4
            L3: ADD DL,37H
            L4: MOV AH,02H
            INT 21H
            LOOP OUTPUT
        MOV DX,offset msg2
        MOV AH,09H
        INT 21H
        INC SI
        MOV CX,BX
        DEC BX
        LOOP L2

.EXIT
END
