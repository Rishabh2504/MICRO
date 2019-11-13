.model tiny

.data

msg1 dw "Array: $"
msg2 dw "Element Found at :$"
msg3 dw "Element Not Found$"

size dw 0
; Element to Search
ele dw 07h
; Sorted Array
arr db 1, 2, 4, 7, 9

.code

mov ax, 5
mov size, ax

mov dx, offset msg1
mov ah, 09h
int 21h

mov si, offset arr
mov cx, size

; Print Array
X:
    mov dl, [si]
    add dl, 30h
    mov ah, 02h
    int 21h
    inc si
    loop X

; For printing a new line (CRLF - Windows Style (\r\n))
mov dl, 13
mov ah, 02h
int 21h
mov dl, 10
mov ah, 02h
int 21h

; Begin = SI, END = DI
mov si, 0h
mov dx, 0h
mov di, size
dec di

SEARCH:
    ; (BEGIN + END) / 2
    ; if BEGIN (SI) > END (DI): FAIL
    cmp si, di
    jg FAIL
    mov ax, 0h
    mov dl, 02h
    add ax, si
    add ax, di
    div dl
    mov bl, al ; bl = MID

    push di
    push bx
    mov bx, offset arr
    pop di

    ; ax = ele, bx = MID, dx = arr[MID]
    mov dl, [bx + di]
    mov bx, di
    pop di
    mov ax, ele
    ; if arr[MID] == ele: SUCCESS, if arr[MID] > ele: RE, if arr[MID] < ele: BEGIN (SI) = MID + 1
    cmp dx, ax
    jz SUCCESS
    jg RE
    add bx, 1
    mov si, bx
    jmp SEARCH

FAIL:
    mov dx, offset msg3
    mov ah, 09h
    int 21h
    jmp QUIT

SUCCESS:
    mov dx, offset msg2
    mov ah, 09h
    int 21h
    ;mov si, offset array
    ;sub bx, si
    mov dx, bx
    add dx, 30h
    mov ah, 02h
    int 21h
    jmp QUIT

RE:
    ; END (DI) = MID - 1
    dec di
    jmp SEARCH

QUIT:
    .exit
    END
