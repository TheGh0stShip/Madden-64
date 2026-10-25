.text
.align 2
.set noreorder
.globl index_planes_accumulate
.ent index_planes_accumulate
index_planes_accumulate:
    addiu $sp,$sp,-0x10
    lw $v0,0x1c8($a0)
    lw $t8,0x70($a0)
    lw $t5,0x78($a0)
    lw $t7,0x18($v0)
    blez $a3,.Ldone
     move $t6,$zero
.Lplane:
    lw $t3,0($a1)
    lw $t4,0($a2)
    move $t2,$t8
    beql $t2,$zero,.Lnext_count
     addiu $a2,$a2,4
.Lcolumn:
    move $t1,$zero
    blez $t5,.Lstore
     move $a0,$zero
    move $t0,$t7
.Lindex:
    lbu $v1,0($t3)
    lw $v0,0($t0)
    addiu $t3,$t3,1
    addu $v0,$v0,$v1
    lbu $v0,0($v0)
    addiu $t1,$t1,1
    addu $a0,$a0,$v0
    slt $v0,$t1,$t5
    bnez $v0,.Lindex
     addiu $t0,$t0,4
.Lstore:
    sb $a0,0($t4)
    addiu $t2,$t2,-1
    bnez $t2,.Lcolumn
     addiu $t4,$t4,1
.Lnext_plane:
    addiu $a2,$a2,4
.Lnext_count:
    addiu $t6,$t6,1
    slt $v0,$t6,$a3
    bnez $v0,.Lplane
     addiu $a1,$a1,4
.Ldone:
    addiu $sp,$sp,0x10
    jr $ra
     nop
.end index_planes_accumulate
