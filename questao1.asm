.data 
msg1: .asciiz "Digite o valor 1: " 
msg2: .asciiz "Digite o valor 2: " 
msg3: .asciiz "Digite o valor 3: "
resp: .asciiz "O resultado é: " 

.text
.globl main

main:

# VALOR 1 
li $v0, 4 # imprime string 
la $a0, msg1 
syscall 

li $v0, 5 # ler inteiro
syscall 

move $t0, $v0 # guarda o valor digitado no endereço t0

# VALOR 2

li $v0, 4 # imprime string 
la $a0, msg2
syscall 

li $v0, 5 # ler inteiro
syscall 

move $t1, $v0 # guarda o valor digitado no endereço t1

# VALOR 3

li $v0, 4 # imprime string 
la $a0, msg3
syscall 

li $v0, 5 # ler inteiro
syscall 

move $t2, $v0 # guarda o valor digitado no endereço t2

add $t0, $t0, $t1 # valor1 = valor1 + valor2
add $t0, $t0, $t2 # valor1 + valor2 = valor1 + valor2 + valor3

li $t1, 3 # carrega imediato 
div $t0, $t1 # divisao
mflo $t2

li $v0, 4 
la $a0, resp

li $v0, 1
move $a0, $t2

syscall 

li $v0, 10
syscall

