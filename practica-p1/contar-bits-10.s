# Cuente cantidad de elementos con ultimos dos bits en 10
.data
    vector: .byte 0x04,0x32, 0x02,0xFF,0x042,0x52,0x58
    finvector:
.text
    la s0, vector #iterador
    la s1, finvector
    li s2, 0 #contador
iterar:
    lb a0, 0(s0) #cargo elemento del iterador
    jal x1, ultimos_bits_en_10
    beq a0, x0, incrementar_vector #si no termina en 10, itero el vector
contar:
    addi s2, s2, 1 #incremento contador
    
incrementar_vector:
    addi s0, s0, 1 #incremento el iterador
    bne s0, s1, iterar
    beq s0, s1, mostrar_contador_fin

mostrar_contador_fin:
    li a7, 1
    add a0, x0, s2 #cargo el contador
    ecall
fin:
    beq x0, x0, fin

ultimos_bits_en_10:
    # Recibe en a0 un word y deja un 1 si termina en bits 10, 0 en otro caso.
    andi a0, a0, 3
    li t1, 2 # Valor esperado al comparar contra la mascara
    
    beq a0, t1, caso_10
    bne a0, t1, otro_caso
    caso_10:
    addi a0, x0, 1
    jal x0, ultimos_bits_en_10_retornar
    otro_caso:
    addi a0, x0, 0
    ultimos_bits_en_10_retornar:
    jalr x0, x1, 0
newline:
    li a7, 11 #char
    li a0, 10 #\n
    ecall
    jalr x0, x1, 0