.text
.align 2
.set noreorder
.globl audio_range_render
.ent audio_range_render
audio_range_render:
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a0
    sw $s2,0x18($sp)
    move $s2,$a2
    sw $s1,0x14($sp)
    move $s1,$a3
    sw $ra,0x20($sp)
    jal func_8003D0C4
     sw $s0,0x10($sp)
    sll $v0,$s1,16
    sra $v1,$v0,16
    addiu $a1,$zero,0x10
    beq $v1,$a1,.Lequal
     move $s0,$s2
    sll $v0,$s2,16
    sra $v0,$v0,16
    bltzl $v0,.Lrounded
     addiu $v0,$v0,0xf
.Lrounded:
    sra $a0,$v0,4
    slti $v0,$v1,0x10
    beqz $v0,.Lhigh
     addiu $v0,$s1,-0x10
    mult $a0,$s1
    mflo $a2
    j .Ldispatch
     move $a1,$s0
.Lhigh:
    subu $v0,$a1,$v0
    mult $a0,$v0
    mflo $a1
    j .Ldispatch
     move $a2,$s0
.Lequal:
    move $a2,$s0
    move $a1,$a2
.Ldispatch:
    move $a0,$s3
    sll $a1,$a1,16
    sll $a2,$a2,16
    sra $a1,$a1,16
    jal func_8003D8F4
     sra $a2,$a2,16
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end audio_range_render
