# Escriba el valor 100 en x7 y luego programe un bucle utilizando el registro x8 como
# contador de 10 a 0. En cada iteración del bucle debe incrementar en uno el valor de x7. Indique
# con qué valor comienza x7 y en qué valor termina luego del bucle.
.text
    addi x7, x0, 100
    addi x8, x0, 10
    
    addi a7, x0, 1
    
loop:
    addi, x7, x7, -1
    addi x8, x8, -1
    
    add a0, x0, x8
    ecall
    
    add a0, x0, x7
    ecall
    
    bne x8, x0, loop
    nop