# Imprimir contenido de posiciones de memoria par cuyo contenido sea par
.data
    vector: .byte 0x04,0x10, 0x02,0xFF,0x033,0x90,0x58
    finvector:
.text
    la s0, vector #iterador
    la s1, finvector
iterar:
    #Valido paridad de la direccion
    add a0, x0, s0 #cargo el valor de la dir. del iterador
    jal x1, es_impar
    beq a0, x0, validar_par_elemento
    bne a0, x0, incrementar
    
validar_par_elemento:
    lb a0, 0(s0) #Cargo el elemento apuntado por el iterador
    jal x1, es_impar
    beq a0, x0, mostrar
    bne a0, x0, incrementar
mostrar:
    li a7, 11
    li a0, 10 #newline
    ecall
    
    li a7, 34 #hexa
    add a0, x0, s0 #Cargo direccion del iterador
    ecall
    
    li a7, 11 #char
    li a0, 44 #comma
    ecall
    
    li a7, 34 #hexa
    lb a0, 0(s0) #Cargo el elemento apuntado por el iterador
    ecall
incrementar:
    addi s0, s0, 1 #incremento el iterador
    bne s0, s1, iterar
    beq s0, s1, fin
    
es_impar: #recibe en a0 el valor y deja en a0 un 1 si es impar
    andi a0, a0, 1
    jalr x0, x1, 0
fin:
    beq x0, x0, fin