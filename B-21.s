# B.21 Modifique el programa de B.20 para encontrar el valor máximo.


.data
    vector: .word -367,-20,40,-365,400,65536,1,3,5, 7, 8, -369, 0
.text
    la x5, vector
    
    # asumo primero como el mayor
    lw t3, 0(x5)
    add x7, x0, t3 # x7 persiste el mayor 

buscar_mayor:     
    beq t3, x0, fin # si termine de recorrer salgo
    addi x5, x5, 4 # aumento un word
        
    lw t3, 0(x5) # cargo el elemento que estoy recorriendo
    bge t3, x7, reemplazar_mayor
    blt t3, x7, buscar_mayor
reemplazar_mayor:
    add x7, x0, t3 # cargo en x7 el temporal (x7 persiste el mayor)
    jal x1, buscar_mayor
fin:
    addi a7, x0, 1 # funcion imprimir
    add a0, x0, x7 # valor a imprimir
    ecall
    