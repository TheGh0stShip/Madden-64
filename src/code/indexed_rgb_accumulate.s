.text
.align 2
.set noreorder
.globl indexed_rgb_accumulate
.ent indexed_rgb_accumulate
indexed_rgb_accumulate:
    lw $v0,0x1c8($a0)
    addiu $sp,$sp,-8
    lw $v0,0x18($v0)
    lw $t8,0x70($a0)
    lw $t7,0($v0)
    lw $t6,4($v0)
    lw $t5,8($v0)
    blez $a3,.Ldone
     move $t3,$zero
    move $t4,$a1
.Lplane:
    lw $t0,0($t4)
    lw $t2,0($a2)
    move $t1,$t8
    beql $t1,$zero,.Lnext_count
     addiu $a2,$a2,4
.Lpixel:
    lbu $v0,0($t0)
    addiu $t0,$t0,1
    lbu $v1,0($t0)
    addiu $t0,$t0,1
    lbu $a0,0($t0)
    addiu $t0,$t0,1
    addu $v0,$t7,$v0
    lbu $v0,0($v0)
    addu $v1,$t6,$v1
    lbu $a1,0($v1)
    addu $a0,$t5,$a0
    lbu $v1,0($a0)
    addiu $t1,$t1,-1
    addu $v0,$v0,$a1
    addu $v0,$v0,$v1
    sb $v0,0($t2)
    bnez $t1,.Lpixel
     addiu $t2,$t2,1
    addiu $a2,$a2,4
.Lnext_count:
    addiu $t3,$t3,1
    slt $v0,$t3,$a3
    bnez $v0,.Lplane
     addiu $t4,$t4,4
.Ldone:
    addiu $sp,$sp,8
    jr $ra
     nop
.end indexed_rgb_accumulate
