.data
    msg1:   .asciiz     "Digite o valor total do produto: "
    msg2:   .asciiz     "Digite o valor da parcela: "
    res1a:  .asciiz     "Haverão "
    res1b:  .asciiz     " parcelas." 
    res2a:  .asciiz     "\nA última parcela será de R$ "
    res2b:  .asciiz     "\nAs parcelas serão iguais."
    mErr1:  .asciiz     "O valor do total deve ser entre R$ 1000.00 e R$ 9999.99\n"
    mErr2:  .asciiz     "O valor da parcela deve ser entre R$ 100.00 e R$ 500.00\n"
.text
    .globl main
        main:
    li      $v0, 4
    la      $a0, msg1
    syscall

    li      $v0, 5
    syscall
    addi    $s1, $v0, 0
    
    blt     $s1, 1000, erro1
    bgt     $s1, 9999, erro1

    li      $v0, 4
    la      $a0, msg2
    syscall

    li      $v0, 5
    syscall
    addi    $s2, $v0, 0

    blt     $s2, 100, erro2
    bgt     $s2, 500, erro2

    div     $s3, $s1, $s2
    mul     $t0, $s2, $s3

    beq     $s1, $t0, sem_par_menor
    
    addi    $s3, $s3, 1
    sub     $s4, $s1, $t0

        sem_par_menor:
    
    li      $v0, 4
    la      $a0, res1a
    syscall

    li      $v0, 1
    addi    $a0, $s3, 0
    syscall
    
    li      $v0, 4
    la      $a0, res1b
    syscall

    bne    $s4, 0 parcela_menor
    
    li      $v0, 4
    la      $a0, res2b
    syscall
    
    li      $v0, 10
    syscall

        parcela_menor:

    li      $v0, 4
    la      $a0, res2a
    syscall

    li      $v0, 1
    addi    $a0, $s4, 0
    syscall

    li      $v0, 10
    syscall

        erro1:
    
    li      $v0, 4
    la      $a0, mErr1
    syscall

    j main

        erro2:
    li      $v0, 4
    la      $a0, mErr2
    syscall

    j main

