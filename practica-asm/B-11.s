# B.11 Escriba el programa “ITOA1024.s” basado en el punto B.09, de forma tal que el número
# impreso por consola sea “1234” y no “4321”. Recomendamos almacenar cada dígito en
# memoria e ir recorriendo la memoria en orden inverso para imprimir por consola. Puede crear
# en memoria .data una variable de 4 bytes que almacene ceros inicialmente y utilizar este
# espacio de memoria para invertir el número.

.data
    aux: .word 0
.text
    li x5, 1234
    li x6, 10
    li x7, 0 # Contador de divisiones
    la x8, aux
    
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
    # --- Muestra al derecho
    # li a7, 1
    # add a0, x0, x5
    # ecall
    
    #Almaceno en aux para mostrar invertido
    sb x5, 0(x8)
    addi x8, x8, 1
    
    add x5, x0, x7
    li x7, 0
    
    bne x5, x0, dividir
    
    #recorro en inverso x8
    addi x8, x8, -1 # resto un byte de direccion
    addi x7, x0, 4  # inicializo contador en 4

recorrer_inverso:
    lb x6, 0(x8) # Leo un digito 
    li a7, 1 # funcion imprimir
    add a0, x0, x6 # valor a imprimir
    ecall
        
    addi x8, x8, -1 # resto un byte de direccion
    addi x7, x7, -1 # resto uno al contador de iteraciones
    
    bne x7, x0, recorrer_inverso
    beq x7, x0, fin_programa
 
 fin_programa:   
    nop