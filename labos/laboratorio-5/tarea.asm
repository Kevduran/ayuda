org   100h

section .text



main:

    MOV CX, 01h

    CALL IniciarModoTexto
    
    MOV BH, 0d ; Establece la página 0
    CALL CentrarCursor
    
    CALL PonerTextoEnColor

    ;CALL CambiarPagina
    
    INT 20h

IniciarModoTexto:
    MOV AH, 0h
    MOV AL, 03h ; Establece modo texto 80x25
    int 10h ; Llama a la interrupción del BIOS para cambiar el modo texto
    RET

CentrarCursor:
    MOV AH, 02h
    MOV DH, 10 ; Fila central
    MOV DL, 25 ; Columna central
    int 10h ; Llama a la interrupción del BIOS para posicionar el cursor
    RET

CambiarPagina:
    MOV AH, 05h
    MOV AL, 01H ; Cambia a la página 1
    INT 10h
    RET

PonerTextoEnColor:
    MOV AH, 09h
    MOV AL, 'K'
    MOV BH, 0
    MOV BL, 93h       ; Atributo (color)
    INT 10h

    MOV AH, 02h
    ;MOV DH, 10        ; Fila
    MOV DL, 26        ; Columna
    INT 10h

    MOV AH, 09h
    MOV AL, 'e'
    MOV BH, 0
    MOV BL, 57h       ; Atributo (color)
    ;MOV CX, 1         ; Repetir una vez
    INT 10h           ; Ejecutar interrupción

    MOV AH, 02h
    ;MOV DH, 10        ; Fila
    MOV DL, 27        ; Columna
    INT 10h

    MOV AH, 09h
    MOV AL, 'v'
    MOV BH, 0
    MOV BL, 6Eh       ; Atributo (color)
    ;MOV CX, 1         ; Repetir una vez
    INT 10h

    MOV AH, 02h
    ;MOV DH, 10        ; Fila
    MOV DL, 28        ; Columna
    INT 10h

    MOV AH, 09h
    MOV AL, 'i'
    MOV BH, 0
    MOV BL, 20h       ; Atributo (color)
    ;MOV CX, 1         ; Repetir una vez
    INT 10h

    MOV AH, 02h
    ;MOV DH, 10        ; Fila
    MOV DL, 29        ; Columna
    INT 10h

    MOV AH, 09h
    MOV AL, 'n'
    MOV BH, 0
    MOV BL, 47h       ; Atributo (color)
    ;MOV CX, 1         ; Repetir una vez
    INT 10h

    RET