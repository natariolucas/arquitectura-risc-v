# B.12 Escriba el programa “ITOA.s” basado en los puntos anteriores pero ahora el número a
# convertir no es solamente el 1024 en x5 sino que puede tener cualquier valor positivo en x5.
# Ejemplo: Si x5=0xBC614E , entonces debe imprimir por consola el 12345678.

.data
    aux: .word 0,0,0 # con 2^32 el numero mas grande son 10 digitos, por lo que con 12 bytes alcanza
.text
    li x5, 0x2C61 # dividendo
    li x6, 10 # divisor 
    li x7, 0 # Contador de divisiones
    la x8, aux # almaceno la variable que va a guardar los digitos para imprimir en inverso
    li x9, 1 #contador de digitos
    
dividir:
restar:
    sub x5, x5, x6 # resto al dividendo el divisor
    addi x7, x7, 1 # sumo 1 al contador de divisiones
    bge x5, x6, restar # si el dividendo es mayor al divisor, sigo restando
    
    blt x5, x0, descarta_ultima_resta # si me pase del cero restando, habia que hacer una resta menos
    bge x5, x0, fin # Si justo llegue al cero, la division es exacta
descarta_ultima_resta:
    add x5, x5, x6 # sumo un "divisor" para descartar la ultima resta
    addi x7, x7, -1 # resto 1 al contador de divisiones
fin:
    # --- Muestra al derecho
    # li a7, 1
    # add a0, x0, x5
    # ecall
    
    #Almaceno en aux para mostrar invertido
    sb x5, 0(x8) # guardo 1 byte (x5 = resultado, *(x8) = direccion de memoria de la variable desplazada )
    addi x8, x8, 1 # me muevo 1 byte en la posicion de memoria
    
    add x5, x0, x7 # piso el resultado de la division con el contador de divisiones para volver a dividir
    li x7, 0 # vuelvo a 0 el contador de divisiones

    addi x9, x9, 1 # sumo uno al contador de digitos    
    bne x5, x0, dividir # division sucesiva

    #recorro en inverso x8
    addi x8, x8, -1 # resto un byte de direccion
    addi x9, x9, -1 # resto uno al contador de digitos
    
recorrer_inverso:
    lb x6, 0(x8) # Leo un digito 
    li a7, 1 # funcion imprimir
    add a0, x0, x6 # valor a imprimir
    ecall
        
    addi x8, x8, -1 # resto un byte de direccion
    addi x9, x9, -1 # resto uno al contador de digitos
    
    bne x9, x0, recorrer_inverso
    beq x9, x0, fin_programa
 
 fin_programa:   
    nop