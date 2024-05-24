ORG 100h

SECTION .text

;Ejercicio 1

;Direccionamiento inmediato
MOV AH, 04h

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




