.data
msgLado1: .asciiz "Forneça um valor para o lado 1: "
msgLado2: .asciiz "Forneça um valor para o lado 2: "
msgLado3: .asciiz "Forneça um valor para o lado 3: "
condicaoSatisfeita: .asciiz "É possível criar um triângulo." 
condicaoInsatisfeita: .asciiz "Não é possível criar um triângulo."

.text
.globl main 

main: 

li $v0, 4 
la $a0, msgLado1
syscall

li $v0, 5
syscall

move $t0, $v0 

li $v0, 4 
la $a0, msgLado2
syscall

li $v0, 5
syscall

move $t1, $v0 

li $v0, 4 
la $a0, msgLado3
syscall

li $v0, 5
syscall

move $t2, $v0 

add $t3, $t2, $t1
add $t4, $t0, $t2
add $t5, $t0, $t1

blt $t0, $t3, condicaoA

li $v0, 4 
la $a0, condicaoInsatisfeita
syscall

li $v0, 10
syscall
 
condicaoA: 

blt $t1, $t4, condicaoB

li $v0, 4 
la $a0, condicaoInsatisfeita
syscall

li $v0, 10
syscall

condicaoB:

blt $t2, $t5, condicaoC

li $v0, 4 
la $a0, condicaoInsatisfeita
syscall

li $v0, 10
syscall

condicaoC:

li $v0, 4 
la $a0, condicaoSatisfeita
syscall

li $v0, 10
syscall 