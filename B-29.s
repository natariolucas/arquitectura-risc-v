# B.29 Dado un vector de 10 elementos:
# .data
# vector: .word 100,-20,40,-365,400,65536,1,0,3,-10
# Utilizando las subrutinas MaxDir y Swap, recorra el vector desde el primer elemento hasta el
# último comparando direcciones consecutivas
# (ej: vector[0] vs vector[1], luego vector[1] vs vector[2], luego vector[2] vs vector[3]....). En cada iteración si el primer elemento es mayor
# que el segundo, utilice swap para intercambiarlos. Al final de las iteraciones debe quedar el
# elemento mayor ubicado al final del vector. Utilice entonces un llamado a PrintVector para
# ver el mismo por consola.

.data
    vector: .word 100,-20,40,-365,400,65536,1,0,3,-10
.text
    la a0, vector
    li a1, 10 # cant elems
    jal x1, PrintVector
    
    li a7, 11
    li a0, 10
    ecall
    
    la s1, vector # dir del vector
    li s2, 9 # contador iteraciones
    iterar_vector:
    beq s2, x0, fin_iteracion
    
    add a0, x0, s1 #arg1 MaxDir - Elem actual
    addi a1, a0, 4 #arg2 MaxDir - Elem sig
    jal x1, MaxDir
    
    bne a0, x0, do_swap
    beq a0, x0, continuar
    do_swap:
        add a0, x0, s1 #arg1 Swap - dir Elem actual
        addi a1, a0, 4  #arg2 Swap - dir Elem sig
        jal x1, Swap
     
    continuar:
    addi s2, s2, -1 # contador iteraciones
    addi s1, s1, 4 # muevo un word
    jal t3, iterar_vector
fin_iteracion:
    la a0, vector
    li a1, 10 # cant elems
    jal x1, PrintVector

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