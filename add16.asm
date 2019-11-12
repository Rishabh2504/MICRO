.MODEL SMALL
.STACK 100H
.DATA
 msg1 db 'Enter first number: $'
 msg2 db 10,13,'Enter second number: $'
 msg3 db 10,13,'Sum of the Number: $'
 num1 dw 0
.CODE
.STARTUP 
         MOV DX,offset msg1
         MOV AH,09H
         INT 21H

         MOV BX,0000H                                       
         MOV CX,4
  Input1:SHL BX,4
         MOV AH,01H
         INT 21H
         SUB AL,30H
         ADD BL,AL
         LOOP Input1

         MOV num1,BX

         MOV DX,offset msg2
         MOV AH,09H
         INT 21H

         MOV BX,0000H                                       
         MOV CX,4
  Input2:SHL BX,4
         MOV AH,01H
         INT 21H
         SUB AL,30H
         ADD BL,AL
         LOOP Input2

         MOV AX,BX
         MOV BX,num1

         ADD AL,BL
         DAA
         ADC AH,BH
         MOV BL,AL
         MOV AL,AH
         DAA
         MOV BH,AL

         MOV DX,offset msg3
         MOV AH,09H
         INT 21H

         JNC L1
         MOV DL,31H
         MOV AH,02H
         INT 21H

      L1:MOV CX,4
  OUTPUT:ROL BX,4   
         MOV DL,BL
         AND DL,0FH
         ADD DL,30H
         MOV AH,02H
         INT 21H
         LOOP OUTPUT

.EXIT
END

