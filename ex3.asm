.data
    msg1:   .asciiz     "Mês de nascimento: "
    msg2:   .asciiz     "Ano de nascimento: "
    msg3:   .asciiz     "Mês atual: "
    msg4:   .asciiz     "Ano atual: "
    msg5:   .asciiz     "Meses: "
    msg6:   .asciiz     "\nAnos: "
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

    li      $v0, 4
    la      $a0, msg4
    syscall

    li      $v0, 5
    syscall
    addi    $s4, $v0, 0

    #s1 mês nasc, s2 ano, s3 mês atual, s4 ano

    sub     $s5, $s3, $s1
    sub     $s6, $s4, $s2

    #s5 mês, s6 ano

    bge     $s5, 0, mes_positivo

    addi    $s5, $s5, 12
    li      $t0, 1
    sub     $s6, $s6, $t0
        
        mes_positivo:
    
    li      $v0, 4
    la      $a0, msg5
    syscall

    li      $v0, 1
    addi    $a0, $s5, 0
    syscall

    li      $v0, 4
    la      $a0, msg6
    syscall

    li      $v0, 1
    addi    $a0, $s6, 0
    syscall

    li      $v0, 10
    syscall


