.data  
    msg1:   .asciiz     "Digite um número: "
    msg2:   .asciiz     "Digite outro número: "
    msg3:   .asciiz     "O primeiro número: "
    msg4:   .asciiz     "O segundo número: "
    q:      .asciiz     "(?)\n"
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

    addi    $t0, $s1, 0
    addi    $s1, $s2, 0
    addi    $s2, $t0, 0
    
    li      $v0, 4
    la      $a0, msg3
    syscall

    li      $v0, 1
    addi    $a0, $s1, 0
    syscall

    li      $v0, 4
    la      $a0, q
    syscall

    li      $v0, 4
    la      $a0, msg4
    syscall

    li      $v0, 1
    addi    $a0, $s2, 0
    syscall

    li      $v0, 4
    la      $a0, q
    syscall

    li      $v0, 10
    syscall
