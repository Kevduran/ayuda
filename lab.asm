org   100h
section     .text

;Limpiamos los registros AX, BX
XOR AX,AX
XOR BX,BX

;Cargar datos
MOV AX, 5d
MOV BX, 13d

main:
  ;Ejecutamos la funcion suma para sumar los valores de AX con BX
  CALL addition
  ;Llamamos la subrutina del main
  CALL subrutine

  INT 20H

subrutine:
  ;Comparamos si el resultado es mayor a 20
  CMP AX, 20d
  ;Si el resultado es mayor a 20 saltamos a la subrutina que imprime "f" "i" "n"
  JA end
  ;Si el resultado no es mayor que 20 entonces sumamos 5 a AX
  CALL addfive
  ;Volvemos a ejecutar esta subrutina para continuar con la comparacion
  JMP subrutine

  RET

addition:
  ADD AX, BX
  RET

addfive:
  ADD AX, 5
  ;El ret de la subrutina retornará a la subrutina desde la cual fue llamada
  ;debido a que se ha utilizado salto incondicional con la instrucción CALL
  RET

end:
  MOV byte[200H], 'e'
  MOV byte[201H], 'n'
  MOV byte[202H], 'd'
  ;El return retornará hacia la línea 23, ya que al llamar la subrutina a través
  ;de un salto condicional, esta retorna hasta el main del codigo
  RET