lui x7,0x10000
addi x10,x10,32
add x6,x6,x0
carga1:    
    sw x6, 0,x7
    addi x7,x7,4
    addi x6,x6,0x10
    addi x10,x10,-1
    bne x0,x10,carga1
lui x8,0x20000
addi x10,x10,32 
carga2:    
      sw x6, 0,x8
    addi x8,x8,4
    addi x6,x6,0x10
    addi x10,x10,-1
    bne x0,x10,carga2

addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32

intercambio:
    lw x11,0,x7
    lw x12,0,x8
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio
fin:
    beq x0,x0,fin

