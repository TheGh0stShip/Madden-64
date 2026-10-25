.text
.align 2
.set noreorder
.globl memory_block_split
.ent memory_block_split
memory_block_split:
    addiu $sp,$sp,-0x20
    sw $s1,0x14($sp)
    sll $v0,$a0,16
    sra $v0,$v0,14
    sw $ra,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s0,0x10($sp)
    lui $at,0x8008
    addu $at,$at,$v0
    lw $s0,-0x5bec($at)
    addiu $v0,$zero,-1
    beq $s0,$v0,.Lfound
     move $s1,$a2
    addiu $v1,$zero,-1
.Lfind:
    lw $v0,0($s0)
    sltu $v0,$v0,$a1
    beqz $v0,.Lfound
     nop
    lw $s0,0xc($s0)
    bne $s0,$v1,.Lfind
     nop
.Lfound:
    lw $v0,4($s0)
    beq $v0,$s1,.Ldone
     sll $v0,$a0,16
    sra $s2,$v0,16
    jal func_80033558
     move $a0,$s2
    lw $v1,0($s0)
    move $a1,$v0
    addu $v1,$v1,$s1
    sw $v1,0($a1)
    lw $v0,4($s0)
    subu $v0,$v0,$s1
    sw $v0,4($a1)
    lhu $v0,8($s0)
    sh $v0,8($a1)
    lw $v0,0xc($s0)
    sw $s0,0x10($a1)
    sw $v0,0xc($a1)
    sw $s1,4($s0)
    sw $a1,0xc($s0)
    lw $v1,0xc($a1)
    addiu $v0,$zero,-1
    bnel $v1,$v0,.Llink_done
     sw $a1,0x10($v1)
.Llink_done:
    lw $a1,0($a1)
    jal func_80032F3C
     move $a0,$s2
.Ldone:
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end memory_block_split
