.data
msg: .asciiz "Digite um número: " 
numImpar: .asciiz "Esse número é ímpar."
numPar: .asciiz "Esse número é par." 

.text
.globl main

main: 

li $v0, 4 
la $a0, msg
syscall

li $v0, 5 
syscall

move $t0, $v0

li $t1, 2
div $t0, $t1
mfhi $t1

beq $t1, $zero, par

li $v0, 4 
la $a0, numImpar
syscall 

j fim

par:

li $v0, 4 
la $a0, numPar
syscall 

fim: 

li $v0, 10
syscall