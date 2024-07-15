ORG 100h

SECTION .text

;Ejercicio 1

;Direccionamiento inmediato
MOV AH, 04h


;ejemplo para la pantalla
;MOV AH, 09H    Activamos la función 09
;MOV AL, 41H    Queremos repetir la letra A
;MOV BH, 00H    En la primera página de pantalla (página 0)
;MOV BL, 72H    En fondo blanco y frente verde
;MOV CX, 03H    Queremos repetir el carácter tres (3) veces.
;INT 10H        Activar la interrupción 10 (modo texto de video)


;MOV AH, 0EH    Activamos la función 0E
;MOV AL, 41H    Queremos repetir la letra A
;MOV BH, 00H    En la primera página de pantalla (página 0)
;MOV BL, 05H    En color magenta
;INT 10H        Activar la interrupción 10 (modo texto de video)


;Direccionamiento por registro
MOV CH, 10h
MOV BL, CH

MOV BH, BL

;Sumo
ADD BH, BL
;Muevo
MOV BP, 210h
MOV AL, BH
MOV [BP], AL
main:

    ;Comparamos si el resultado es menor a 20
    CMP BH, 30h

    ;Si el resultado es menor a 20 saltamos a la subrutina que imprime "f" "i" "n"
    ;JB menor que
    ;JA mayor que
    JB subrutine

    INT 20h

subrutine:
    MOV byte[200H], 'e'
    MOV byte[201H], 'n'
    MOV byte[202H], 'd'
    ;El return retornará hacia la línea 23, ya que al llamar la subrutina a través
    ;de un salto condicional, esta retorna hasta el main del codigo

    RET




