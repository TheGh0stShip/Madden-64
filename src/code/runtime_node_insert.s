.text
.align 2
.set noreorder
.globl runtime_node_insert
.ent runtime_node_insert
runtime_node_insert:
    addiu $sp,$sp,-0x28
    sw $s1,0x14($sp)
    lui $s1,0x8008
    lw $s1,0x773c($s1)
    sw $s4,0x20($sp)
    move $s4,$a0
    sw $ra,0x24($sp)
    sw $s3,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s0,0x10($sp)
    lw $v0,0x18($s1)
    move $s3,$a1
    beqz $v0,.Linsert
     move $s2,$a2
    andi $v1,$s3,0xffff
.Lwalk:
    lhu $v0,2($s1)
    sltu $v0,$v0,$v1
    beqz $v0,.Linsert
     nop
    lw $s1,0x18($s1)
    lw $v0,0x18($s1)
    bnez $v0,.Lwalk
     nop
.Linsert:
    lui $a0,0x8009
    lw $a0,-0x5044($a0)
    jal func_80033298
     nop
    lw $v1,0x18($s1)
    move $a0,$zero
    move $s0,$v0
    addiu $a1,$s0,8
    addiu $a2,$zero,0xc
    move $a3,$zero
    sw $v1,0x18($s0)
    sw $s0,0x18($s1)
    sh $s2,0($s0)
    sh $s2,0x16($s0)
    sh $s3,2($s0)
    jal func_80033308
     sw $s4,4($s0)
    move $v0,$s0
    sh $zero,0x14($v0)
    lw $ra,0x24($sp)
    lw $s4,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end runtime_node_insert
