#B.14 Basado en el ejercicio B.13, realice un programa que imprima por consola el valor del
# número en orden inverso (ej: 127 se imprime como 721). Luego considerando que los strings
# terminan con un carácter nulo (0x00) diseñe un programa que almacene el string “YVAN EHT
# NIOJ” y lo muestre por consola en orden inverso buscando primero la ubicación del caracter
# nulo y recorriendo en sentido inverso el string
.data
    aux: .string "127"
    navy: .string "YVAN EHT NIOJ"
.text
    # -----------------------------------
     la x5, aux # cargo dir de la variable
     li a7, 11 # funcion imprimir char
    
     lb a0, 0(x5) # cargo 1er byte
     ecall
    
     lb a0, 1(x5) # cargo 2do byte
     ecall
    
     lb a0 2(x5) # cargo 3er byte
     ecall
     
     li a0, 10 #newline
     ecall
    #-----------------------------------
    
    la x5, navy # cargo dir de la variable para moverme
    la x6, navy # backup de la dir de la variable
    
    lb x7, 0(x5) # cargo en x7 el valor del byte de memoria
    bne x7, x0, buscar_nulo
    beq x7, x0, mostrar_inverso # nulo encontrado
    
buscar_nulo:
    addi x5, x5, 1 # avanzo
    lb x7, 0(x5) # cargo en x7 el valor del byte de memoria
    bne x7, x0, buscar_nulo
    beq x7, x0, mostrar_inverso # nulo encontrado
    
mostrar_inverso:
    beq x6, x5, fin
    addi x5, x5, -1 # un caracter anterior
    
    li a7, 11 # funcion imprimir char
    lb a0, 0(x5)
    ecall
    
    bne x6, x5, mostrar_inverso
    
fin:
    nop