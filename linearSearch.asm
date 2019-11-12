.MODEL SMALL
.STACK 100H
.DATA
A db 7,8,9,15,2
num db 15
msg1 db 10,13,'Number Found at Index $'
msg2 db 10,13,'Number Not Found $'
.CODE
.STARTUP 

    MOV SI,0
    MOV BL,num

    MOV CX,5 
    Output: CMP A[SI],BL
            JE L1
            INC SI
            LOOP Output

    MOV DX,offset msg2
    MOV AH,09H
    INT 21H
    .EXIT


    L1: MOV DX,offset msg1
        MOV AH,09H
        INT 21H
        MOV DX,SI
        ADD DL,30H
        MOV AH,02H
        INT 21H

.EXIT
END
