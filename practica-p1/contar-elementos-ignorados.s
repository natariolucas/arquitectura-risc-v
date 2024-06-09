.data
    vector: .word 1,-152,45,-16,-3,4,3,-10,-21,-500,0
.text
    la x4,vector
    lw x5,0(x4)
    li x20,0 #contador de no neg

loop:
    blt x0,x5,NoNeg
    beq x5,x0,mostrar
    addi x20,x20,1
    addi x4,x4,4
    lw x5,0(x4)
    j loop
    
    
mostrar: 
    add a0,x20,x0
    li a7,1
    ecall
    bge x0,x0,fin    


NoNeg:
    addi x4,x4,4
    lw x5,0(x4)
    j loop
    
fin:
    li x1, 0x48
    jalr x0,x1,0