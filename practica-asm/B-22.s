# B.22 Dado un vector con valores enteros sin signo, escriba un programa que encuentre cuál es
# el valor mínimo almacenado y lo informe por consola. El vector posee N elementos, pero se
# sabe que el último elemento del mismo siempre es 0 (el cual no debe ser tenido en cuenta en ...)
# (... el resultado). Una vez completado el programa modifique los valores del vector con distintos
# casos de prueba.

.data
    vector: .word 1,2,3,0
.text
    la x5, vector
    
    # asumo primero como el menor
    lw t3, 0(x5)
    add x7, x0, t3 # x7 persiste el menor 

buscar_menor:     
    addi x5, x5, 4 # aumento un word
        
    lw t3, 0(x5) # cargo el elemento que estoy recorriendo
    beq t3, x0, fin # si termine de recorrer salgo - El ultimo elemento no se tiene en cuenta
    
    blt t3, x7, reemplazar_menor
    bge t3, x7, buscar_menor
reemplazar_menor:
    add x7, x0, t3 # cargo en x7 el temporal (x7 persiste el mayor)
    jal x1, buscar_menor
fin:
    addi a7, x0, 1 # funcion imprimir
    add a0, x0, x7 # valor a imprimir
    ecall
    