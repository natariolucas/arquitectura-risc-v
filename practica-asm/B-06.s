# B.06 Escriba un programa que almacene el número 2 en x5 , el número 3 en x6 y 0 en x7.
# Realice un bucle de forma tal que 'x7 = x7 + x5' mientras que x6>0 (decrementando x6 en cada iteración ). 
# Indique el valor que queda en x7 luego del bucle. ¿Qué sucedería si el mismo programa se ejecuta cambiando los valores de x5=10 y x6=8 ? 
# Almacene el programa en su computadora como “mult_x5_por_x6.s”.

.text
    li x5, 10
    li x6, 8
    li x7, 0
    
loop:
    add x7, x7, x5
    addi x6, x6, -1
    bne x6, x0, loop
    
    li a7, 1
    add a0, x0, x7
    ecall