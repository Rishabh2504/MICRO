.MODEL SMALL
.STACK 100H
.DATA
 msg1 db 'Enter first number: $'
 msg2 db 10,13,'Enter second number: $'
 msg3 db 10,13,'Sum of the Number: $'
 num1 db 0
.CODE         
.STARTUP 
         MOV DX,offset msg1
         MOV AH,09H
         INT 21H
         MOV BL,00H
         MOV CX,2
  Input1: SHL BL,4
         MOV AH,01H
         INT 21H
         SUB AL,30H
         ADD BL,AL
         LOOP Input1
         MOV num1,BL

         MOV DX,offset msg2
         MOV AH,09H
         INT 21H

         MOV BL,00H
         MOV CX,2
  Input2: SHL BL,4
         MOV AH,01H
         INT 21H
         SUB AL,30H
         ADD BL,AL
         LOOP Input2
         MOV AL,BL
         ADD AL,num1
         DAA
         MOV BL,AL

         MOV DX,offset msg3
         MOV AH,09H
         INT 21H

         JNC L1
         MOV DL,31H
         MOV AH,02H
         INT 21H

      L1:MOV CX,2
  OUTPUT:ROL BL,4   
         MOV DL,BL
         AND DL,0FH
         ADD DL,30H
         MOV AH,02H
         INT 21H
         LOOP OUTPUT

.EXIT
END
