ORG 100h

SECTION .data
encabezado db 'Parcial final de Arquitectura$' ;Debe de indicarse con $ el fin de la cadena
opc1 db 'Para mostrar el triangulo presione 1$'
opc2 db 'Para mnostrar la figura presione 2$'
opc3 db 'Para salir presione 3$'
nombre db 'Kevin Josue Duran Rugamas - 00088020$'

resp1 db 'Ingresaste la opcion del triangulo$'
resp2 db 'Ingresaste la opcion de la figura$'

msgfin db 'Fin del programa$'


SECTION .text

main:
    CALL IniciarModoTexto

    MOV BH, 0d ; Establece la página 0
    CALL CentrarCursor

    CALL Menu
    
    CALL EscogerOpcion

    CALL EsperarTecla

IniciarModoTexto:
    MOV AH, 0h
    MOV AL, 03h ; Establece modo texto 80x25
    int 10h ; Llama a la interrupción del BIOS para cambiar el modo texto
    RET

CentrarCursor:
    MOV AH, 02h
    MOV DH, 5 ; Fila central
    MOV DL, 15 ; Columna central
    int 10h ; Llama a la interrupción del BIOS para posicionar el cursor
    RET

CambiarPagina:
    MOV AH, 05h
    MOV AL, 01H ; Cambia a la página 1
    INT 10h
    RET

Menu:
    MOV AH, 09h
    MOV DX, encabezado
    INT 21h

    MOV AH, 02h
    MOV DH, 7 ; Fila siguiente
    MOV DL, 15 ; Columna siguiente
    INT 10h

    MOV AH, 09h
    MOV DX, opc1
    INT 21h

    MOV AH, 02h
    MOV DH, 9 ; Fila siguiente
    MOV DL, 15 ; Columna siguiente
    INT 10h

    MOV AH, 09h
    MOV DX, opc2
    INT 21h

    MOV AH, 02h
    MOV DH, 11 ; Fila siguiente
    MOV DL, 15 ; Columna siguiente
    INT 10h

    MOV AH, 09h
    MOV DX, opc3
    INT 21h

    MOV AH, 02h
    MOV DH, 20 ; Fila siguiente
    MOV DL, 15 ; Columna siguiente
    INT 10h

    MOV AH, 09h
    MOV DX, nombre
    INT 21h

    RET

EscogerOpcion:
    
    MOV AH, 00h         ; Establece la función para leer el carácter
    INT 16h

    ;Se guarda el numero en ASCII del presionado en AL
    CMP AL, 49d ;49 es el numero 1 en codigo ASCII
    JE opcion1

    CMP AL, 50d ;50 es el numero 2 en ASCII
    JE opcion2

    CMP AL, 51d ;51 es el numero 3 en ASCII
    JE opcion3

    JMP EscogerOpcion

    RET

EsperarTecla:
    MOV AH, 00h
    INT 16h
    RET

opcion1:
    MOV AH, 05h
    MOV AL, 01H ; Cambia a la página 1
    INT 10h

    MOV AH, 09h
    MOV DX, resp1
    INT 21h
    RET

opcion2:
    MOV AH, 05h
    MOV AL, 01H ; Cambia a la página 1
    INT 10h

    MOV AH, 09h
    MOV DX, resp2
    INT 21h
    RET

opcion3:
    MOV AH, 05h
    MOV AL, 01H ; Cambia a la página 1
    INT 10h

    MOV AH, 09h
    MOV DX, msgfin
    INT 21h
    
    INT 20h
    
    RET