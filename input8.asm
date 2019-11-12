.MODEL SMALL
.STACK 100H
.DATA
 msg1 db 'Enter a number: $'
 msg2 db 10,13,'You Enter this Number: $'
.CODE
.STARTUP 
         MOV DX,offset msg1
         MOV AH,09H
         INT 21H

         MOV BL,00H

         MOV CX,2
  Input: SHL BL,4
         MOV AH,01H
         INT 21H
         SUB AL,30H
         ADD BL,AL
         LOOP Input

         MOV DX,offset msg2
         MOV AH,09H
         INT 21H

         MOV CX,2
 Output :ROL BL,4
         MOV DL,BL
         AND DL,0FH
         ADD DL,30H
         MOV AH,02H
         INT 21H
         LOOP Output

.EXIT
END
