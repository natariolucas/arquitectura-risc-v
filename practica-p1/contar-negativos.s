.data
    vector: .word 10,5,30,-1,-10,-5,23,40,-78,-5,100,0
.text
    #Parte 1
    la s0, vector #dir iterador
    li a0, 0 #cantidad de negs
iterar:
    lw s1, 0(s0) # elemento iterado
    
    blt s1, x0,incrementar_negativos
    bgt s1, x0, incrementar_iteracion
    beq s1, x0, fin_iteracion
    incrementar_negativos: #incrementa  a0
        addi a0, a0, 1
    incrementar_iteracion:
        addi s0, s0, 4
        jal x0, iterar
fin_iteracion:
    li a7, 1
    ecall
loop:
    beq x0,x0,loop


    jalr x0, x1, 0

            
        
    