# B.07 Escriba un programa que dado un número almacenado en x5 (ej: x5=234), el mismo sea
# dividido por 10, dejando en x7 la cantidad de veces que entra 10 en ese número, y en x8 el
# resto. NO utilizar la instrucción de división, se puede resolver con un bucle contando cuantas
# veces se le pueden restar 10 a x5 y que el mismo sea mayor que 10. Almacene el programa en
# su computadora como “div_x5_por_10.s”

.text
    li x5, 20
    li x6, 10
    li x7, 0 # Contador de divisiones
restar:
    sub x5, x5, x6 # resto al dividendo el divisor
    addi x7, x7, 1
    bge x5, x6, restar
    
    blt x5, x0, descarta_ultima_resta
    bge x5, x0, llena_resto
descarta_ultima_resta:
    add x5, x5, x6
    addi x7, x7, -1
llena_resto:
    add x8, x0, x5 # llevo a x8 el resto
    
    
    
    