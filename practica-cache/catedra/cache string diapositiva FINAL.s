
.text

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
addi x8,x8,-128 #linea 4 word 0 0x00000040
addi x10,x0,32


intercambio:       # 0x00000050
    lw x11,0,x7
    lw x12,0,x8
    sw x12,0,x7
    jal salto #salto al mas alla
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
vuelve:
    bne x0,x10,intercambio


addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


# no se ejecuta en esta prueba

lui x11,0x30000
li x10,0x65747345   
sw x10,0,x11
addi x11,x11,4 
li x10,0x6f727020   
sw x10,0,x11
addi x11,x11,4
li x10,0x6d617267   
sw x10,0,x11
addi x11,x11,4
li x10,0x6f732061   
sw x10,0,x11
addi x11,x11,4
li x10,0x73206f6c
sw x10,0,x11
addi x11,x11,4
li x10,0x65767269
sw x10,0,x11
addi x11,x11,4
li x10,0x72617020
sw x10,0,x11
addi x11,x11,4
li x10,0x6f6d2061
sw x10,0,x11
addi x11,x11,4
li x10,0x61727473
sw x10,0,x11
addi x11,x11,4
li x10,0x20656c72
sw x10,0,x11
addi x11,x11,4
li x10,0x6f6c2061
sw x10,0,x11
addi x11,x11,4
li x10,0x6c612073
sw x10,0,x11
addi x11,x11,4
li x10,0x6f6e6d75
sw x10,0,x11
addi x11,x11,4
li x10,0x65642073
sw x10,0,x11
addi x11,x11,4
li x10,0x71724120
sw x10,0,x11
addi x11,x11,4
li x10,0x65746975
sw x10,0,x11
addi x11,x11,4
li x10,0x72757463
sw x10,0,x11
addi x11,x11,4
li x10,0x65642061
sw x10,0,x11
addi x11,x11,4
li x10,0x6d6f6320
sw x10,0,x11
addi x11,x11,4
li x10,0x61747570
sw x10,0,x11
addi x11,x11,4
li x10,0x61726f64
sw x10,0,x11
addi x11,x11,4
li x10,0x6f632073
sw x10,0,x11
addi x11,x11,4
li x10,0x66206f6d
sw x10,0,x11
addi x11,x11,4
li x10,0x69636e75
sw x10,0,x11
addi x11,x11,4
li x10,0x20616e6f
sw x10,0,x11
addi x11,x11,4
li x10,0x6d20616c
sw x10,0,x11
addi x11,x11,4
li x10,0x726f6d65
sw x10,0,x11
addi x11,x11,4
li x10,0x63206169
sw x10,0,x11
addi x11,x11,4
li x10,0x65686361
sw x10,0,x11
addi x11,x11,4

lui x5,0x30000
imprime:    
    lb x6,0(x5)
    addi x5,x5,1
    add a0,x0,x6
    addi a7,x0,11
    ecall
    
    bne x6,x0,imprime
fin:
   beq x0,x0,fin


salto:
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    jal vuelve
    bne x0,x10,intercambio



