.data
valor1: .word 0
cnt: .word 0 # contador 
texto1: .asciiz "Digite o limite superior:  "
texto2: .asciiz "Digite o limite inferior: "

.text
.globl main 

main:

li $v0, 4 # syscall 4 -> imprime string
la $a0, texto1  # carrega o endereço da mensagem
syscall 

li $v0, 5 # syscall 5 -> ler inteiro
syscall

move $t0, $v0 # guarda o valor digitado em t0

move $t1, $zero 

loop:

move $a0, $t1
li $v0, 1 # syscall 1 -> imprimir inteiro
syscall 

li $a0, 10 # quebra de linha 
li $v0, 11 # syscall 11 -> imprime caractere
syscall 

addi $t1, $t1, 1 # t1 = t1 + 1 -> incremento 

ble $t1, $t0, loop

syscall