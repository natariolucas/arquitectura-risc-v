# B.26 Escriba una subrutina llamada MaxDir. La misma va a recibir en a0 la dirección de un
# dato (número signado) y en a1 la dirección de otro dato (número signado). La subrutina debe
# retornar en a0 el valor 1 si el dato almacenado en la dirección de memoria apuntada por a0 es
# mayor que el dato almacenado en la dirección de memoria apuntada por a1.

.data
    numero: .word 400
    otro_numero: .word -200
.text
    la a0, numero
    la a1, otro_numero
    jal x1, MaxDir
    
    addi a7, x0, 1
    ecall
    
fin_loop:
    beq x0, x0, fin_loop
MaxDir:
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
    