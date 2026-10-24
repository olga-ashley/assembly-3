.data
    msg1:   .asciiz     "Coeficiente A: "
    msg2:   .asciiz     "Coeficiente B: "
    msg3:   .asciiz     "Ceoficiente C: "
    delPos: .asciiz     "Possui duas raízes reais."
    delZer: .asciiz     "Possui uma raiz real."
    delNeg: .asciiz     "Não possui raízes reais."
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

    li      $v0, 4
    la      $a0, msg3
    syscall

    li      $v0, 5
    syscall
    addi    $s3, $v0, 0

    li      $t0, 4
    mul     $t1, $t0, $s1
    mul     $t2, $t1, $s3   #4*a*c
    mul     $t3, $s2, $s2   #delta²
    sub     $s0, $t3, $t2

    bgt     $s0, 0, duas_raizes
    blt     $s0, 0, nenhuma_raiz
    
    li      $v0, 4
    la      $a0, delZer
    syscall

    li      $v0, 10
    syscall

        duas_raizes:
    li      $v0, 4
    la      $a0, delPos
    syscall

    li      $v0, 10
    syscall

        nenhuma_raiz:
    li      $v0, 4
    la      $a0, delNeg
    syscall

    li      $v0, 10
    syscall


