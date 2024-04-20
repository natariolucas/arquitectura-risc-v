# B.23 Escriba una subrutina llamada Max, la cual debe recibir en a0 y en a1 
# (x10 y x11 respectivamente) dos números signados y devolver cual de los dos es el mayor en a0.

.text
    li a0, 0
    #li a1, 4.294.967.296
    lui a1, 0xfffff
    li a2, 0xfff
    add a1, a1, a2 # a1 = 32 bits en 1
    
    jal x1, Max
    
    li a7, 1
    ecall
fin:
    beq x0, x0, fin

Max:
    bge a1,a0,a1_mayor
    bge a0, a1,a0_mayor
    a1_mayor:
        addi a0, a1, 0
    a0_mayor:
jalr x0, x1, 0