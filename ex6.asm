.data
    msg1:   .asciiz     "Primeiro número: "
    msg2:   .asciiz     "Segundo número: "
    semDif: .asciiz     "Os números são iguais."
    comDif: .asciiz     "Os números são diferentes.\n"
    comp:   .asciiz     " é maior que "

.text
    .globl main

        main:
    li      $v0, 4
    la      $a0, msg1
    syscall

    li      $v0, 5
    syscall
    addi    $s1, $v0, 0

    li      $v0, 4
    la      $a0, msg2
    syscall

    li      $v0, 5
    syscall
    addi    $s2, $v0, 0

    bgt    $s1, $s2, a_maior
    bgt    $s2, $s1, b_maior

    li      $v0, 4
    la      $a0, semDif
    syscall

    li      $v0, 10
    syscall

        a_maior:
    li      $v0, 4
    la      $a0, comDif
    syscall
    
    li      $v0, 1
    addi    $a0, $s1, 0
    syscall
    
    li      $v0, 4
    la      $a0, comp
    syscall

    li      $v0, 1
    addi    $a0, $s2, 0
    syscall

    li      $v0, 10
    syscall

        b_maior:
    
    li      $v0, 4
    la      $a0, comDif
    syscall

    li      $v0, 1
    addi    $a0, $s2, 0
    syscall
    
    li      $v0, 4
    la      $a0, comp
    syscall

    li      $v0, 1
    addi    $a0, $s1, 0
    syscall

    li      $v0, 10
    syscall