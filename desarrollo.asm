ORG 100h ;Debe empezar con esto siempre ya que el espacio de 0 a 99 esta reservado para ejecucion

SECTION .text ; Aca va toda la parte que se va a ejecutar como variables y cosas asi.

;CODIGO

inmediato: ; Indica el metodo de movimiento
    
    MOV AH, 12d ;mover un valor 12 decimal a AH
    MOV AL, 0FFh ; mover un valor FF en hexadecimal a AL (cuando sean letras deben iniciar con un 0)
    MOV BH, 10010b ;mover un valor 10010 binario a BH
    MOV BL, "A" ;mover una letra "A" a BL 

por_registro: ;los registros deben tener el mismo tamaño
    MOV CX, AX 
    MOV DX, BX


;limpiar registro
;XOR AX, AX

absoluto:
    ;ESTAMOS PASANDO 8 BITS ENTRE UNO Y OTRO
    MOV [200], CH  ;registro -> direccion de memoria
    MOV AH, [200]   ;direccion de memoria -> registro

    ;pasamos ahora de 16 bits
    MOV [210h], DX
    MOV BX, [210h]

    ;MOV byte[220h], 12d

indirecto:
    MOV BP, 200h
    MOV AL, [BP]

    MOV [BP+1], AH

XOR AX,AX ;limpiando


INT 20h ;indica el fin del programa