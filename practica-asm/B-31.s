# B.31 Escriba un programa llamado Burbujeo, que utilice PushMax 10 veces consecutivamente
# sobre el vector. El mismo debería quedar ordenado de menor a mayor luego de las 10
# iteraciones. En cada iteración llame a PrintVector para ver como se ordena.

.data
    vector: .word 9,8,7,6,5,4,3,2,1,0
.text
    la a0, vector
    li a1, 10 # cant elems
    jal x1, PrintVector


    #newline
    li a7, 11
    li a0, 10
    ecall
        
    li s1, 10 #cant elems
    iterar_pushmax:
        addi s1, s1 -1 #contador de iteraciones
        beq s1, x0, fin_iterar_pushmax #chequeo el corte

        #llamada a pushmax
        la a0, vector
        li a1,10 # cant elems    
        jal x1, PushMax
        
        #print
        la a0, vector
        li a1, 10 # cant elems
        jal x1, PrintVector
        
        #newline
        li a7, 11
        li a0, 10
        ecall
        
        #itero
        jal x1, iterar_pushmax
    fin_iterar_pushmax:
    
    #newline
    li a7, 11
    li a0, 10
    ecall
    
    la a0, vector
    li a1, 10 # cant elems
    jal x1, PrintVector
 
     jal x1, fin
PushMax:
    add s9, x0, x1 # backup return register    
    
    add s10, x0, a0 # dir del vector
    add s11, x0, a1 # contador de iteraciones
    addi s11, s11, -1
    
    iterar_vector:
    beq s11, x0, fin_iteracion
    
    add a0, x0, s10 #arg1 MaxDir - Elem actual
    addi a1, a0, 4 #arg2 MaxDir - Elem sig
    jal x1, MaxDir
    
    bne a0, x0, do_swap
    beq a0, x0, continuar
    do_swap:
        add a0, x0, s10 #arg1 Swap - dir Elem actual
        addi a1, a0, 4  #arg2 Swap - dir Elem sig
        jal x1, Swap
     
    continuar:
    addi s11, s11, -1 # contador iteraciones
    addi s10, s10, 4 # muevo un word
    jal t2, iterar_vector
fin_iteracion:
    jalr x0, s9, 0

fin:
    li a7, 10
    ecall
    
PrintVector: # recibo en a0 el inicio del vector y en a1 cant de elementos
    add t1, x0, a0 # bkp inicio vector
    PrintVector_Iterar:
    beq a1, x0, PrintVector_Fin
    
    addi a7, x0, 1 # printInt
    lw a0, 0(t1) # guardo elem posicion
    ecall
    
    addi a7, x0, 11 # printChar
    addi a0, x0, 44 # comma
    ecall
    
    addi a1, a1, -1
    addi t1, t1, 4 # muevo un word
    jal t2, PrintVector_Iterar
    PrintVector_Fin:
    jalr x0, x1, 0

MaxDir: # recibe en a0 y en a1 dos direcciones, deja 1 en a0 si a0 es mayor
    lw a0, 0(a0) # cargo valores apuntados para pasar a max
    lw a1, 0(a1) # cargo valores apuntados para pasar a max
    add t4, x0, x1 # bkp return reg
    jal x1, Max
    jalr x0, t4, 0
    
Max:
    bge a1,a0,a1_mayor
    bge a0, a1,a0_mayor
    a1_mayor:
        addi a0, x0, 0
        jalr x0, x1, 0
    a0_mayor:
        addi a0, x0, 1
        jalr x0, x1, 0
Swap:
    lw t0, 0(a0) # guardo valor de a0
    lw t1, 0(a1) # guardo valor de a1
    
    sw t0, 0(a1) # pongo valor de a0 en a1
    sw t1, 0(a0) # pongo valor de a1 en a0
    jalr x0, x1, 0