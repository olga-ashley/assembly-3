.data
        msg1: .asciiz "Coloque o valor em real: "
        msg2: .asciiz "O valor em reais é igual a: "
.text
    .globl main

        main:
    
    li      $v0, 4
    la      $a0, msg1
    syscall

    li      $v0, 5
    syscall
    addi    $t0, $v0, 0
    li      $t1, 5
    div     $t0, $t1
    mflo    $s0

    li      $v0, 4
    la      $a0, msg2
    syscall

    li      $v0, 1
    addi	$a0, $s0, 0	
    syscall

    li      $v0, 10
    syscall