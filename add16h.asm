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
  Input1: SHL BX,4
         MOV AH,01H
         INT 21H
         CMP AL,'A'
         JGE L1
         SUB AL,30H
         JMP L2
      L1:SUB AL,37H
      L2:ADD BL,AL
         LOOP Input1
         MOV num1,BX

         MOV DX,offset msg2
         MOV AH,09H
         INT 21H

         MOV BX,0000H
         MOV CX,4
  Input2: SHL BX,4
         MOV AH,01H
         INT 21H
         CMP AL,'A'
         JGE L3
         SUB AL,30H
         JMP L4
      L3:SUB AL,37H
      L4:ADD BL,AL
         LOOP Input2

         ADD BX,num1
         
         MOV DX,offset msg3
         MOV AH,09H
         INT 21H

         MOV DL,0
         ADC DL,30H
         CMP DL,30H
         JE L5
         MOV AH,02H
         INT 21H

      L5:MOV CX,4
  OUTPUT:ROL BX,4   
         MOV DL,BL
         AND DL,0FH
         CMP DL,9
         JG L6
         ADD DL,30H
         JMP L7
      L6:ADD DL,37H
      L7:MOV AH,02H
         INT 21H
         LOOP OUTPUT

.EXIT
END
