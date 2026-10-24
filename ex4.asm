.data
    msg1:   .asciiz     "Digite o salário atual: "
    msg2:   .asciiz     "O novo salário é de: "
.text
    .globl main

        main:
    li      $v0, 4
    la      $a0, msg1
    syscall

    li      $v0, 5
    syscall
    addi    $s0, $v0, 0

    li      $t1, 25
    mul     $t2, $s0, $t1
    
    li      $t3, 100
    div     $s1, $t2, $t3
    
    li      $v0, 4
    la      $a0, msg2
    syscall

    li      $v0, 1
    add     $a0, $s0, $s1
    syscall

    li      $v0, 10
    syscall