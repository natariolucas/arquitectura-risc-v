# B.02 Escriba las instrucciones necesarias en Ripes para lograr que el registro x5 tenga el valor hexadecimal 0x12345678
# B.04 Luego de resolver B.02, almacene en x7 el valor de x5 menos uno
  lui x5, 0x12345
  addi x5, x5, 678
  addi x6, x5, -1