ORG   100h

SECTION .text

; Limpiamos los registros AX, BX
XOR BX, BX
XOR AX, AX

; Cargar datos
MOV BX, 5d ;numero para multiplicar
MOV BP, BX ;Contador

main:
  ; Llamamos la subrutina del main
  CALL subrutine

  INT 20H

subrutine:
  ; Comparamos si el contador es mayor a 0
  CMP BP, 1d
  ; Si el resultado es menor a 20 saltamos a la subrutina que imprime "f" "i" "n"
  JB end
  ; Si el resultado no es mayor que 20 entonces sumamos 5 a AX
  CALL mulfive
  ; Volvemos a ejecutar esta subrutina para continuar con la comparación
  CALL subrutina_resta
  
  JMP subrutine

  RET

subrutina_resta:
  SUB AX, 1d
  RET

mulfive: ;Multiplico el numero por el contador 5x5, 5x4, 5x3...
  IMUL AX, BP
  RET

end:
  MOV byte[200H], 'e'
  MOV byte[201H], 'n'
  MOV byte[202H], 'd'
  RET