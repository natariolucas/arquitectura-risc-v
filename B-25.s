# B.25 Modifique el programa B.21 para que utilice la subrutina de B.23. Tenga en cuenta
# recorrer el vector copiando el valor de cada elemento al registro a1, el valor máximo actual en
# a0, y la subrutina dejará en a0 el valor del máximo entre esos dos elementos. Luego es
# cuestión de ir cargando en a1 el valor del elemento actual del vector hasta llegar al final.


.data
    vector: .word 10,20,20000,30000,948948, -19876789,0
.text
    la x5, vector
    
    # asumo primero como el mayor
    lw a1, 0(x5)
    add a0, x0, a1 # x7 persiste el mayor 

buscar_mayor:     
    beq a1, x0, fin # si termine de recorrer salgo
    addi x5, x5, 4 # aumento un word
        
    lw a1, 0(x5) # cargo el elemento que estoy recorriendo
    jal x1, Max
    jal x1, buscar_mayor
fin:
    addi a7, x0, 1 # funcion imprimir
    ecall
fin_loop:
    beq x0, x0, fin_loop
    
Max:
    bge a1,a0,a1_mayor
    bge a0, a1,a0_mayor
    a1_mayor:
        addi a0, a1, 0
    a0_mayor:
jalr x0, x1, 0