# B.28 Dado un vector de 10 elementos:
# .data
# vector: .word 100,-20,40,-365,400,65536,1,0,3,-10
# Escriba una subrutina llamada PrintVector, la cual reciba en a0 la dirección de comienzo del
# vector y en a1 la cantidad de elementos del mismo. Imprima por consola los elementos del
# vector separados por coma (ej: 100, -20, 40, -365, 400, 65536, 1, 0, 3, -10 ).

.data
    vector: .word 100,-20,40,-365,400,65536,1,0,3,-10

.text
    la a0, vector
    li a1, 10
    jal x1, PrintVector

fin:
    addi a7, x0, 10
    ecall

PrintVector:
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