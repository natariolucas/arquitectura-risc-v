# B.10 Escriba un programa llamado “DIV8.s”. El mismo debe tomar un valor en el registro x5 y
# dividirlo por 8. NO se puede usar el método de restas sucesivas, y el mismo debe funcionar
# para valores positivos o negativos. Ej: si x5 = -25, el resultado es -3. Repase la instrucción
# SRAI.

# Al hacer SRAI, si el valor original es de signo negativo e impar (bms == 1)
# debemos restar uno al resultado

.text
    li x5,-25
    add x7, x0, x5
    srai x5, x5, 3
    
    bge x5 x0, fin
    blt x5, x0, verificar_resto_0
verificar_resto_0:
    andi x8, x7, 7
    bne x8, x0, corregir_division
    beq x8, x0, fin
    
corregir_division:
    addi x5, x5, 1
    
fin:
    addi a7, x0, 1
    add a0, x0, x5
    ecall
    
    nop