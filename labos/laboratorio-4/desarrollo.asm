ORG   100h

SECTION .text

; Limpiamos los registros AX, BX
XOR AX, AX
XOR BX, BX

; Cargar datos
MOV AX, 5d
MOV BX, 13d

main:
  ; Ejecutamos la función suma para sumar los valores de AX con BX
  CALL addition
  ; Llamamos la subrutina del main
  CALL subrutine

  INT 20H

subrutine:
  ; Comparamos si el resultado es mayor a 20
  CMP AX, 20d
  ; Si el resultado es mayor a 20 saltamos a la subrutina que imprime "f" "i" "n"
  JA end
  ; Si el resultado no es mayor que 20 entonces sumamos 5 a AX
  CALL addfive
  ; Volvemos a ejecutar esta subrutina para continuar con la comparación
  JMP subrutine

  RET

addition:
  ADD AX, BX
  RET

addfive:
  ADD AX, 5
  RET

end:
  MOV byte[200H], 'e'
  MOV byte[201H], 'n'
  MOV byte[202H], 'd'
  RET