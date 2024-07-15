org 100h
section .text

setup:
    MOV SI, 50d ; Columna inicial
    MOV DI, 25d ; Fila inicial

    ;MOV BP, 160d ; contador PARA AUMENTAR LA FILA INICIAL

main:
    CALL IniciarModoVideo
    CALL EncenderPixel
    CALL EsperarTecla
     
    INT 20H

IniciarModoVideo:
    MOV AH, 0h
    MOV AL, 12h      ; Modo gráfico 640x480, 16 colores
    INT 10h
    RET

EncenderPixel:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 0100b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h           ; Enciende el píxel

    .while(CX<=54)
    INC CX
    MOV AL, 0fh
    MOV AH, 0ch
    int 10h
    .endw

    MOV DX, 26
    MOV CX, 57
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h

    MOV DX, 27
    MOV CX, 59
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h

    MOV DX, 28
    MOV CX, 61
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h

    MOV DX, 29
    MOV CX, 63

    .while(dx<=32)
    INC DX
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h
    .endw

    MOV DX, 34
    MOV CX, 61
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h

    MOV DX, 35
    MOV CX, 59
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h

    MOV DX, 36
    MOV CX, 57
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h

    MOV DX, 37
    MOV CX, 56
    MOV BH, 0
    while(CX>=52)
    DEC CX
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h
    endw

    MOV DX, 36
    MOV CX, 49
    MOV AL, 0fh
    MOV AH, 0ch
    INT 10h

    RET

EsperarTecla:
    MOV AH, 00h
    INT 16h        ; Lee una tecla del teclado
    RET
