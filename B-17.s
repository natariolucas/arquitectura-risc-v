# B.17 Modifique el programa B.16 para que pueda aceptar números de exactamente 4 dígitos.

.data
    numero: .string "8127"
    miles: .word 0, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000
    centena: .word 0,100,200,300,400,500,600,700,800,900
    decena: .word 0,10 ,20, 30, 40, 50, 60, 70, 80, 90
    unidad: .word 0,1 ,2 ,3, 4, 5, 6, 7, 8, 9
.text
    # G: Lectura
    # A: Aca se están leyendo los valores ASCII de cada caracter, byte a byte, y le 
    #    resta 48 que es el valor del 0 en ASCII, para de esa forma llevar el valor ASCII
    #    del número, al valor numerico propio
    la x4 numero
    
    lb x5,0(x4)
    addi x5,x5,-48
    
    lb x6,1(x4)
    addi x6,x6,-48
    
    lb x7,2(x4)
    addi x7,x7,-48
    
    lb x8,3(x4)
    addi x8,x8,-48
    
        
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
    
    
# A: Se está convirtiendo el numero de string a tipo word (int)