# B.02 Escriba las instrucciones necesarias en Ripes para lograr que el registro x5 tenga el valor hexadecimal 0x12345678
# B.03 Luego de resolver B.02, almacene en x6 el valor de x5 más uno..text
  lui x5, 0x12345
  addi x5, x5, 678
  addi x6, x5, 0x1