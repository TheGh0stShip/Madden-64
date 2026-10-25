.text
.align 2
.set noreorder
.globl tiled_columns_copy
.ent tiled_columns_copy
tiled_columns_copy:
    addiu $sp,$sp,-8
    lw $t4,0x18($sp)
    lw $t3,0x20($a0)
    lw $t6,0x70($a0)
    addiu $t4,$t4,-1
    bltz $t4,.Ldone
     nop
.Lplane:
    blez $t3,.Lnext_plane
     move $t1,$zero
    sll $t5,$a2,2
    move $t2,$a1
.Lcolumn:
    lw $v0,0($t2)
    move $a0,$t6
    lw $v1,0($a3)
    addu $v0,$t5,$v0
    lw $t0,0($v0)
    beqz $a0,.Lcolumn_done
     addu $v1,$v1,$t1
.Lbyte:
    lbu $v0,0($t0)
    addiu $t0,$t0,1
    addiu $a0,$a0,-1
    sb $v0,0($v1)
    bnez $a0,.Lbyte
     addu $v1,$v1,$t3
.Lcolumn_done:
    addiu $t1,$t1,1
    slt $v0,$t1,$t3
    bnez $v0,.Lcolumn
     addiu $t2,$t2,4
.Lnext_plane:
    addiu $a2,$a2,1
    addiu $t4,$t4,-1
    bgez $t4,.Lplane
     addiu $a3,$a3,4
.Ldone:
    addiu $sp,$sp,8
    jr $ra
     nop
.end tiled_columns_copy
