# B.18 Modifique el programa B.17 para que pueda aceptar números de hasta 4 dígitos. A
# diferencia de los anteriores, en este programa son válidos los números “1234”, “1”,
# “6502”,”543”,”999”,”0001”,”0023”,”0123”,”0000”, etc. No siempre serán de 4 dígitos. Tenga en
# cuenta que los strings terminan con un carácter nulo (0x00). Sugerimos pensar esto como 4
# casos posibles (1 dígito, 2 dígitos, 3 dígitos, 4 dígitos), y dependiendo del caso saltar al caso
# correspondiente.

.data
    numero: .string "0321"
    miles: .word 0, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000
    centena: .word 0,100,200,300,400,500,600,700,800,900
    decena: .word 0,10 ,20, 30, 40, 50, 60, 70, 80, 90
    unidad: .word 0,1 ,2 ,3, 4, 5, 6, 7, 8, 9
.text
    # lectura
    la x4 numero
    jal x1, contar_digitos #devuelve en a1
    add s2, x0, a1 # save cantidad de digitos en s2
    
    addi s3, x0, 4
    beq s2, s3, leer_4_digitos
    
    addi s3, x0, 3
    beq s2, s3, leer_3_digitos
    
    addi s3, x0, 2
    beq s2, s3, leer_2_digitos
    
    addi s3, x0, 1
    beq s2, s3, leer_1_digito

# x5: miles, x6: centenas, x7: decenas, x8: unidades

leer_4_digitos:
    add a2, x0, x4
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x5, x0, a1 # guardo los miles 
    
    add a2, x0, x4
    addi a2, a2, 1
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x6 x0, a1 # guarda las centenas
    
    add a2, x0, x4
    addi a2, a2, 2
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x7, x0, a1 # guarda las decenas
    
    add a2, x0, x4
    addi a2, a2, 3
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x8, x0, a1 # guarda las unidades
    
    jal x1, calcular_peso_posiciones

leer_3_digitos:
    addi x5, x0, 0 # seteo en 0 los miles 
    
    add a2, x0, x4
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x6, x0, a1 # guarda las centenas
    
    add a2, x0, x4
    addi a2, a2, 1
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x7, x0, a1 # guarda las decenas
    
    add a2, x0, x4
    addi a2, a2, 2
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x8, x0, a1 # guarda las unidades
    
    jal x1, calcular_peso_posiciones
    
leer_2_digitos:
    addi x5, x0, 0 # seteo en 0 los miles 
    addi x6, x0, 0 # seteo en 0 las centenas 
    
    add a2, x0, x4
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x7, x0, a1 # guarda las decenas
    
    add a2, x0, x4
    addi a2, a2, 1
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x8, x0, a1 # guarda las unidades
    
    jal x1, calcular_peso_posiciones
    
leer_1_digito:
    addi x5, x0, 0 # seteo en 0 los miles 
    addi x6, x0, 0 # seteo en 0 las centenas 
    addi x7, x0, 0 # seteo en 0 las decenas 

    add a2, x0, x4
    jal x1, char_a_byte #lee un byte de a2 y guarda en a1
    add x8, x0, a1 # guarda las unidades

calcular_peso_posiciones:
            
    # Calculo Miles
    addi x9,x0,0
    la x10,miles
    slli x5,x5,2 

    add x10,x10,x5
    lh x11,0(x10) 
                     
    add x9,x9,x11
    
    # G: Calculo Centena
    la x10,centena
    slli x6,x6,2 # G: direccion al byte a palabra 
                    # A: Multiplica por 4 para pasar a ser el sumando de la dirección base del vector
    add x10,x10,x6
    lh x11,0(x10) # G: centena almacena valores mayores al rango [-128:127] 
                     # A: Lee el valor del vector
    add x9,x9,x11    # A: Lo persiste en x9
    
    # G: Calculo Decena
    la x10,decena
    slli x7,x7,2 # G: direccion al byte a palabra
    add x10,x10,x7
    lb x11,0(x10) # A: Carga elemento del vector
    add x9,x9,x11 # A: Suma la decena a la centena anteriormente persistida
    
    # G: Calculo Unidad
    la x10,unidad
    slli x8,x8,2 # G: direccion al byte a palabra
    add x10,x10,x8
    lb x11,0(x10)
    add x9,x9,x11
    
    jal x1, fin

contar_digitos: #Cuenta digitos y deja el valor en a1
    la a1, numero #direccion para avanzar
    la a3, numero #backup direccion
    lb a2, 0(a1) # temp para cargar los valores de cada dir
    beq a2, x0, volver_contar_digitos
    buscar_nulo:
        addi a1, a1, 1
        lb a2, 0(a1)
        bne a2, x0, buscar_nulo
volver_contar_digitos:
    sub a1, a1, a3
    jalr x0, x1, 0
    
char_a_byte: #lee de a2 y devuelve en a1
    lb a1, 0(a2)
    addi a1, a1, -48
    jalr x0, x1, 0
    
fin:
    addi a7, x0, 1
    add a0, x0, x9
    ecall