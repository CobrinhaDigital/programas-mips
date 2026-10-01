.data
valor: .word 0
msg: .asciiz "Digite um valor: "

.text
.globl main

main: 

li $v0, 4
la $a0, msg # imprime mensagem
syscall 

li $v0, 5 # le inteiro 
syscall 

move $t0, $v0 # guarda valor
move $t1, $zero # zera registrador

loop: 

blez $t0, fim # branch on less or equal to zero 

add $t1, $t1, $t0 # o valor é o próprio contador 
addi $t0, $t0, -1

j loop # volta para o início do loop 

fim: 

move $a0, $t1
li $v0, 1
syscall

li $v0, 10
syscall