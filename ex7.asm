.data
    msgI:   .asciiz     "Digite um número: "
    msgC:   .asciiz     "Centena: "
    msgD:   .asciiz     "\nDezena: "
    msgU:   .asciiz     "\nUnidade: "
.text
    .globl main

        main:
    li      $v0, 4
    la      $a0, msgI
    syscall

    li      $v0, 5
    syscall
    addi    $s0, $v0, 0

    blt     $s0, 100, n_centena

    li      $t1, 100
    div     $s1, $s0, $t1
    mul     $t0, $s1, $t1
    sub     $s0, $s0, $t0
    n_centena:
    blt     $s0, 10, n_dezena
    
    li      $t1, 10
    div     $s2, $s0, $t1
    mul     $t0, $s2, $t1
    sub     $s0, $s0, $t0
    n_dezena:
    
    li      $v0, 4
    la      $a0, msgC
    syscall

    li      $v0, 1
    addi    $a0, $s1, 0
    syscall

    li      $v0, 4
    la      $a0, msgD
    syscall

    li      $v0, 1
    addi    $a0, $s2, 0
    syscall

    li      $v0, 4
    la      $a0, msgU
    syscall

    li      $v0, 1
    addi    $a0, $s0, 0
    syscall

    li      $v0, 10
    syscall