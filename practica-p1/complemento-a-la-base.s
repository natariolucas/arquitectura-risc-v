# Leer cada elemento, complementarlo a la base y guardar el dato en la misma posicion
.data
    vector: .byte 0x04,0x10, 0x02,0xFF,0x033,0x90,0x58
    finvector:
.text
    la s0, vector #iterador
    la s1, finvector
iterar:
    jal x1, newline
    jal x1, newline
    
    #muestro el original
    add a1, x0, s0 #cargo la dir del iterador
    jal x1, mostrar_dir
    jal x1, newline
    
    lb a0, 0(s0) #cargo el elemento apuntado por el iterador
    jal x1, complemento_a_la_base
    
    #En a0 tengo el complemento
    add a1, x0, s0 # Cargo la dir del iterador
    jal x1, copy
    
    add a1, x0, s0 #Cargo la dir del iterador
    jal x1, mostrar_dir #Deberia mostrar la dir y el elemento complementado
    
incrementar:
    addi s0, s0, 1 #incremento el iterador
    bne s0, s1, iterar
    beq s0, s1, fin

fin:
    beq x0, x0, fin
    
complemento_a_la_base: #recibe en a0 un valor y lo pisa con su C.B.
    sub a0, x0, a0 #CB
    jalr x0, x1, 0
copy:
    # Recibe en a0 un byte y en a1 una dir de memoria. 
    # Guarda en la dir de a1 el byte a0
    sb a0, 0(a1)
    jalr x0, x1, 0
mostrar_dir: #recibe en a1 una dir. printea esa dir y un byte
    li a7, 34 #hex
    add a0, x0, a1
    ecall
    
    li a7, 11 #char
    li a0, 44 #comma
    ecall
    
    li a7, 1 #hex
    lb a0, 0(a1)
    ecall
    
    jalr x0, x1, 0
newline:
    li a7, 11 #char
    li a0, 10 #\n
    ecall
    jalr x0, x1, 0