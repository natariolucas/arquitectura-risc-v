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
intercambio:       # PC 0x00000048
    lw x11,0,x7
    lw x12,0,x8
    sw x12,0,x7
    jal salto # 0x00000054 salto a 0x0000026c
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
vuelve:
    bne x0,x10,intercambio #PC 0x00000068

# no se ejecuta en esta prueba
addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32

blt x7,x8,fin

intercambio2:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio2


addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


intercambio3:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio3


addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


intercambio4:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio4


addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


intercambio5:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio5

addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


intercambio6:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio6
    
    addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


intercambio7:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio7
    
addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


intercambio8:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio8

addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


intercambio9:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4 #aca empieza a pisar
    addi x10,x10,-1
    bne x0,x10,intercambio9
    
addi x7,x7,-128
addi x8,x8,-128
addi x10,x0,32


intercambio10:
    lw x11,0,x7
    lw x12,0,x8
    addi x11,x11,0x10
    addi x12,x12,0x20
    sw x12,0,x7
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    bne x0,x10,intercambio10


addi x7,x7,-128 #linea 4 word 0 0x00000240
addi x8,x8,-128
addi x10,x0,32

#fin relleno

salto:
    sw x11,0,x8
    addi x7,x7,4
    addi x8,x8,4
    addi x10,x10,-1
    jal vuelve		#PC 0x0000027C salta a 0x00000068
    bne x0,x10,intercambio



 
fin:
    beq x0,x0,fin

