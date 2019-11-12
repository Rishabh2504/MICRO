.MODEL SMALL
.STACK 100H
.DATA
 msg1 db 'Enter a ASCII character: $'
 msg2 db 10,13,'ASCII character in Binary: $'
.CODE
.STARTUP 
         MOV DX,offset msg1
         MOV AH,09H
         INT 21H
       
         MOV AH,01H
         INT 21H
         MOV BL,AL

         MOV DX,offset msg2
         MOV AH,09H
         INT 21H

         MOV CX,8
  OUTPUT:ROL BL,1
         MOV DL,BL
         AND DL,01H
         ADD DL,30H
         MOV AH,02H
         INT 21H
         LOOP Output

.EXIT
END
