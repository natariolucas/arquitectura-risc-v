# B.09 Escriba un programa llamado “ITOAREVERSE.s”. El mismo debe grabar en el registro x5
# el valor decimal 1234. Luego debe dividir el mismo por 10 (utilizando el método de restassucesivas de B.07), mostrar el valor del resto por consola
# (recuerde que el ASCII del carácter 0 es 0x30 y el 9 es 0x39), y almacenar el resultado nuevamente en x5. Continuar ejecutando
# esta secuencia hasta que x5 sea cero


.text
    li x5, 12345
    li x6, 10
    li x7, 0 # Contador de divisiones
    
dividir:
restar:
    sub x5, x5, x6 # resto al dividendo el divisor
    addi x7, x7, 1
    bge x5, x6, restar
    
    blt x5, x0, descarta_ultima_resta
    bge x5, x0, fin
descarta_ultima_resta:
    add x5, x5, x6
    addi x7, x7, -1
fin:
    li a7, 1
    add a0, x0, x5
    ecall
    
    add x5, x0, x7
    li x7, 0
    bne x5, x0, dividir
    
    nop