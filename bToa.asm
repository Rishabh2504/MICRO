.MODEL SMALL
.STACK 100H
.DATA
 msg1 db 'Enter a BINARY NUMBER: $'
 msg2 db 10,13,'ASCII character of Binary Number: $'
.CODE
.STARTUP 
         MOV DX,offset msg1
         MOV AH,09H
         INT 21H

         MOV BL,00H

         MOV CX,8
  Input: SHL BL,1
         MOV AH,01H
         INT 21H
         SUB AL,30H
         ADD BL,AL
         LOOP Input

         MOV DX,offset msg2
         MOV AH,09H
         INT 21H

         MOV DL,BL
         MOV AH,02H
         INT 21H

.EXIT
END
