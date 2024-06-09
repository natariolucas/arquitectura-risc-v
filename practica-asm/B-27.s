# B.27 Escriba una subrutina llamada Swap. La misma va a recibir en a0 la dirección de un dato
# (número signado) y en a1 la dirección de otro dato (número signado). La subrutina debe
# intercambiar el contenido de ambos. Ej: Si a0=0x10000000 , quiere decir que en la dirección
# de memoria 0x1000000 existe un dato (supongamos -10). Luego si a1=0x10000004, quiere
# decir que en 0x10000004 existe otro dato (supongamos 5). Si se llama a la subrutina con esas
# referencias a memoria la misma debe retornar habiendo guardado 5 en 0x10000000 y -10 en
# 0x10000004.

.data
    numero: .word 100
    otro_numero: .word 200
.text
    la a0, numero
    la a1, otro_numero
    jal x1, Swap

    # Muestro numero
    addi a7, x0, 1     
    la a0, numero
    lw a0, 0(a0)
    ecall
    
    #newline
    addi a7, x0, 11    
    addi a0, x0, 10
    ecall
    
    # Muestro otro_numero
    addi a7, x0, 1     
    la a0, otro_numero
    lw a0, 0(a0)
    ecall
 
fin:
    addi a7, x0, 10
    ecall

Swap:
    lw t0, 0(a0) # guardo valor de a0
    lw t1, 0(a1) # guardo valor de a1
    
    sw t0, 0(a1) # pongo valor de a0 en a1
    sw t1, 0(a0) # pongo valor de a1 en a0
jalr x0, x1, 0