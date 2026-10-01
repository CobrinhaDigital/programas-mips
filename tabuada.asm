.data
msg: .asciiz "Digite um valor: " 
operadorMultiplicacao: .asciiz " * " 
operadorIgual: .asciiz " = "
quebraDeLinha: .asciiz "\n"

.text
.globl main 

main: 

li $v0, 4
la $a0, msg
syscall 

li $v0, 5
syscall

move $t0, $v0
move $t1, $v0

li $t2, 10
li $t3, 1

beq $t0, $zero, casoZero

loop: 

bge $t3, $t2, fim

addi $t0, $t0, 10

li $v0, 1 # imprime multiplicando
move $a0, $t1
syscall

li $v0, 4 # imprime * 
la $a0, operadorMultiplicacao
syscall

li $v0, 1 # imprime multiplicador 
move $a0, $t2
syscall 

li $v0, 4 # imprime =
la $a0, operadorIgual 
syscall 

li $v0, 1 # imprime resultado
move $a0, $t0 
syscall

li $v0, 4 # quebra linha
la $a0, quebraDeLinha 
syscall 

addi $t3, $t3, 1 # incrementa contador

j loop # volta para o inicio do loop 

casoZero:

bge $t3, $t2, fim

li $v0, 1 # imprime multiplicando
move $a0, $t0
syscall

li $v0, 4 # imprime * 
la $a0, operadorMultiplicacao
syscall

li $v0, 1 # imprime multiplicador 
move $a0, $t2
syscall 

li $v0, 4 # imprime =
la $a0, operadorIgual 
syscall 

li $v0, 1 # imprime zero
move $a0, $t0
syscall

li $v0, 4 # quebra linha
la $a0, quebraDeLinha 
syscall 

addi $t3, $t3, 1 # incrementa contador

j casoZero # volta para o inicio do loop 

fim: 

li $v0, 10
syscall