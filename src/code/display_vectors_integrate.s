.text
.align 2
.set noreorder
.globl display_vectors_integrate
.ent display_vectors_integrate
display_vectors_integrate:
    move $t0,$a0
    move $a2,$zero
    lui $a3,%hi(D_8007AB04)
    addiu $a3,$a3,%lo(D_8007AB04)
    addiu $t1,$a3,4
    andi $v0,$a2,0xffff
.Lloop:
    sll $v0,$v0,4
    addu $v0,$v0,$t0
    lw $a0,0($v0)
    lw $a1,4($v0)
    lw $t2,8($v0)
    lw $t3,0($a3)
    .word 0x014b0018
    mfhi $t6
    mflo $t7
    sll $t6,$t6,16
    srl $t7,$t7,16
    or $v1,$t6,$t7
    lw $t2,8($v0)
    addiu $a2,$a2,1
    addu $a0,$a0,$v1
    sw $a0,0($v0)
    lw $t3,0($t1)
    .word 0x014b0018
    mfhi $t6
    mflo $t7
    sll $t6,$t6,16
    srl $t7,$t7,16
    or $v1,$t6,$t7
    addu $a1,$a1,$v1
    sw $a1,4($v0)
    sw $zero,8($v0)
    andi $v0,$a2,0xffff
    sltiu $v0,$v0,8
    bnezl $v0,.Lloop
     andi $v0,$a2,0xffff
    jr $ra
     nop
.end display_vectors_integrate
