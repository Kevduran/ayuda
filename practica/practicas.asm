ORG 100h

SECTION .data
encabezado db 'Parcial final de Arquitectura$' ;Debe de indicarse con $ el fin de la cadena
opc1 db 'Para mostrar el triangulo presione 1$'
opc2 db 'Para mnostrar la figura presione 2$'
opc3 db 'Para salir presione 3$'
nombre db 'Kevin Josue Duran Rugamas - 00088020$'

;resp1 db 'Ingresaste la opcion del triangulo$'
;resp2 db 'Ingresaste la opcion de la figura$'

msgfin db 'Fin del programa$'


SECTION .text

setup:
    MOV SI, 90d ; Columna inicial
    MOV DI, 70d ; Fila inicial

    MOV BP, 70d ; contador PARA AUMENTAR LA FILA INICIAL

main:
    CALL IniciarModoTexto

    MOV BH, 0d ; Establece la página 0
    CALL CentrarCursor

    CALL Menu
    
    CALL EscogerOpcion

    MOV SI, 90d ; Columna inicial
    MOV DI, 70d ; Fila inicial

    MOV BP, 70d ; contador PARA AUMENTAR LA FILA INICIAL

    CALL main

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
    JMP IniciarModoTriaungulo

    RET

IniciarModoTriaungulo:
    MOV AH, 0h
    MOV AL, 12h      ; Modo gráfico 640x480, 16 colores
    INT 10h
    
    JMP EncenderPixelTriangulo

    RET


EncenderPixelTriangulo:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1010b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h           ; Enciende el píxel

    INC DI
    CMP DI, 250d 
    JNE EncenderPixelTriangulo

    INC SI            ; Incrementa la columna
    INC BP

    CMP BP, 250d
    JE EsperarTecla

    MOV DI, BP

    CMP SI, 300d      ; Compara la columna actual con el límite de 190
    JNE EncenderPixelTriangulo
    
    
    RET               ; Termina la función cuando el rectángulo está completo

opcion2:
    JMP IniciarModoFigura

    RET

IniciarModoFigura:
    MOV AH, 0h
    MOV AL, 12h      ; Modo gráfico 640x480, 16 colores
    INT 10h
        
    JMP EncenderPixelFiguraCara
    
    RET

EncenderPixelFiguraCara:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1001b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h           ; Enciende el píxel
      
    INC SI            ; Incrementa la columna
    CMP SI, 500d      ; Compara la columna actual con el límite de 190
    JNE EncenderPixelFiguraCara ; Continúa en la misma fila si no se alcanza el límite
      
    ; Al alcanzar el límite de la fila, prepara la siguiente fila
    INC DI            ; Incrementa la fila
    MOV SI, 90d       ; Reinicia la columna al inicio para la nueva fila
      
    CMP DI, 300d      ; Compara la fila actual con el límite de 120
    JNE EncenderPixelFiguraCara ; Si no se alcanza el límite, continúa dibujando la fila
    
    ;Llamada para oreja 1
    MOV SI, 90d ; Columna inicial
    MOV DI, 50d ; Fila inicial

    MOV BP, 50d ; contador PARA AUMENTAR LA FILA INICIAL

    JMP EncenderPixelFiguraOreja

    RET               ; Termina la función cuando el rectángulo está completo

EncenderPixelFiguraOreja:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1100b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h           ; Enciende el píxel

    INC DI
    CMP DI, 70d 
    JNE EncenderPixelFiguraOreja

    INC SI            ; Incrementa la columna
    INC BP

    CMP BP, 70d
    JE ConfigFiguraOtraOreja

    MOV DI, BP

    CMP SI, 110d      ; Compara la columna actual con el límite de 190
    JNE EncenderPixelFiguraOreja

    RET

ConfigFiguraOtraOreja:
    ;Llamada para oreja 2
    MOV SI, 480d ; Columna inicial
    MOV DI, 50d ; Fila inicial

    MOV BP, 50d ; contador PARA AUMENTAR LA FILA INICIAL

    JMP EncenderPixelFiguraOtraOreja

    RET

EncenderPixelFiguraOtraOreja:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1100b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h           ; Enciende el píxel

    INC DI
    CMP DI, 70d 
    JNE EncenderPixelFiguraOtraOreja

    INC SI            ; Incrementa la columna
    INC BP

    CMP BP, 70d
    JE ConfigFiguraNariz

    MOV DI, BP

    CMP SI, 500d      ; Compara la columna actual con el límite de 190
    JNE EncenderPixelFiguraOtraOreja

    RET

ConfigFiguraNariz:
    ;Llamada para nariz
    MOV SI, 275d ; Columna inicial
    MOV DI, 150d ; Fila inicial
    
    MOV BP, 150d ; contador PARA AUMENTAR LA FILA INICIAL
    
    JMP EncenderPixelFiguraNariz
    
    RET
    
EncenderPixelFiguraNariz:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 0010b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h           ; Enciende el píxel
    
    INC DI
    CMP DI, 200d 
    JNE EncenderPixelFiguraNariz
    
    INC SI            ; Incrementa la columna
    INC BP
    
    CMP BP, 200d
    JE ConfigFiguraBigotesUno
    
    MOV DI, BP
    
    CMP SI, 800d      ; Compara la columna actual con el límite de 190
    JNE EncenderPixelFiguraNariz
    
    RET

ConfigFiguraBigotesUno:
    ;Llamada para nariz
    MOV SI, 30d ; Columna inicial
    MOV DI, 150d ; Fila inicial
    
    ;MOV BP, 150d ; contador PARA AUMENTAR LA FILA INICIAL
    
    JMP EncenderPixelFiguraBigote
    
    RET

EncenderPixelFiguraBigote:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1010b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h

    INC SI
    CMP SI, 130d
    JNE EncenderPixelFiguraBigote
    JE ConfigFiguraBigotesDos

    RET

ConfigFiguraBigotesDos:
    ;Llamada para nariz
    MOV SI, 30d ; Columna inicial
    MOV DI, 175d ; Fila inicial
        
    ;MOV BP, 150d ; contador PARA AUMENTAR LA FILA INICIAL
        
    JMP EncenderPixelFiguraBigoteDos
        
    RET
    
EncenderPixelFiguraBigoteDos:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1010b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h
    
    INC SI
    CMP SI, 130d
    JNE EncenderPixelFiguraBigoteDos
    JE ConfigFiguraBigotesTres
    
    RET

ConfigFiguraBigotesTres:
    ;Llamada para nariz
    MOV SI, 30d ; Columna inicial
    MOV DI, 200d ; Fila inicial
            
    ;MOV BP, 150d ; contador PARA AUMENTAR LA FILA INICIAL
            
    JMP EncenderPixelFiguraBigoteTres
            
    RET
        
EncenderPixelFiguraBigoteTres:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1010b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h
        
    INC SI
    CMP SI, 130d
    JNE EncenderPixelFiguraBigoteTres
    JE ConfigFiguraBigotesCuatro
        
    RET

ConfigFiguraBigotesCuatro:
    ;Llamada para nariz
    MOV SI, 450d ; Columna inicial
    MOV DI, 150d ; Fila inicial
                
    ;MOV BP, 150d ; contador PARA AUMENTAR LA FILA INICIAL
                
    JMP EncenderPixelFiguraBigoteCuatro
                
    RET
            
EncenderPixelFiguraBigoteCuatro:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1010b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h
            
    INC SI
    CMP SI, 550d
    JNE EncenderPixelFiguraBigoteCuatro
    JE ConfigFiguraBigotesCinco
            
    RET

ConfigFiguraBigotesCinco:
    ;Llamada para nariz
    MOV SI, 450d ; Columna inicial
    MOV DI, 175d ; Fila inicial
                    
    ;MOV BP, 150d ; contador PARA AUMENTAR LA FILA INICIAL
                    
    JMP EncenderPixelFiguraBigoteCinco
                    
    RET
                
EncenderPixelFiguraBigoteCinco:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1010b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h
                
    INC SI
    CMP SI, 550d
    JNE EncenderPixelFiguraBigoteCinco
    JE ConfigFiguraBigotesSeis
                
    RET

ConfigFiguraBigotesSeis:
    ;Llamada para nariz
    MOV SI, 450d ; Columna inicial
    MOV DI, 200d ; Fila inicial
                        
    ;MOV BP, 150d ; contador PARA AUMENTAR LA FILA INICIAL
                        
    JMP EncenderPixelFiguraBigoteSeis
                        
    RET
                    
EncenderPixelFiguraBigoteSeis:
    MOV AH, 0Ch       ; Función del BIOS para poner un píxel
    MOV AL, 1010b     ; Color del píxel (azul)
    MOV BH, 0         ; Página de video 0
    MOV CX, SI        ; Coordenada X
    MOV DX, DI        ; Coordenada Y
    INT 10h
                    
    INC SI
    CMP SI, 550d
    JNE EncenderPixelFiguraBigoteSeis
    JE EsperarTecla
                    
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