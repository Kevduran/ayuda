ORG 100h

SECTION .text

; Ejercicio 1

    ; Direccionamiento absoluto
    mov ah, 0x0 ; Leemos un carácter de la entrada estándar
    mov bx, 200h ; Cargamos la dirección del buffer
    int 21h ; Realizamos la llamada al sistema DOS para leer el carácter
    mov al, [bx] ; Movemos el carácter leído al registro AL

    ; Mover el dato BC a un registro
    mov bl, al

main:
    ; Realizar la multiplicación
    jmp multi ; Saltar a la rutina de multiplicación

multi:
    ; Rutina de multiplicación
    mov al, 3
    mul bl ; Multiplicar el contenido de BL por 3
    cmp ax, 0FFFFh ; Comparar el resultado con FFFFh
    jb multi ; Si es menor, repetir la multiplicación
    mov [210h], ax ; Si es mayor o igual, almacenar el resultado en la dirección 0210h

    ; Aquí iría el código que deseas ejecutar después de la comparación
    ; Por ejemplo, podrías imprimir el resultado o realizar alguna otra acción

    ; Para propósitos de demostración, simplemente salimos del programa
    mov ah, 0x4C ; Realizamos una llamada al sistema DOS para salir del programa
    int 21h
