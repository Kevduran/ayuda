ORG 100h

SECTION .text


MOV AH, 1000b ;movimiento tipo inmediato
MOV AL, AH ; movimiento por registro
MOV [203h], AH ;movimiento absoluto
MOV [204h], AH ;movimiento absoluto
MOV BP, 200h ;movimiento indirecto
MOV [209h], BP ;movimiento indirecto
MOV AH, 0010b ; movimiento inmediato
MOV [206h], AH ; movimiento absoluto
MOV BH, 0d
MOV [201h], BH

INT 20h
