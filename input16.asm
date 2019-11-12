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

         MOV BX,0000H

         MOV CX,4
  Input: SHL BX,4
         MOV AH,01H
         INT 21H
         SUB AL,30H
         ADD BL,AL
         LOOP Input

         MOV DX,offset msg2
         MOV AH,09H
         INT 21H

         MOV CX,4
 Output :ROL BX,4
         MOV DX,BX
         AND DX,000FH
         ADD DX,0030H
         MOV AH,02H
         INT 21H
         LOOP Output

.EXIT
END
