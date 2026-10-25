.text
.align 2
.set noreorder
.globl resource_context_reset
.ent resource_context_reset
resource_context_reset:
    addiu $sp,$sp,-0x20
    sw $s2,0x18($sp)
    lui $s2,%hi(D_8006928C)
    addiu $s2,$s2,%lo(D_8006928C)
    sw $ra,0x1c($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lhu $v0,0($s2)
    move $s1,$a1
    beqz $v0,.Lcreate
     move $s0,$a0
    lui $a0,%hi(D_8006928E)
    lhu $a0,%lo(D_8006928E)($a0)
    lui $a1,%hi(D_80069290)
    lw $a1,%lo(D_80069290)($a1)
    jal func_80035F88
     nop
.Lcreate:
    andi $a0,$s0,0xffff
    jal audio_entry_resource_mark
     move $a1,$s1
    lui $at,%hi(D_80069294)
    sw $v0,%lo(D_80069294)($at)
    addiu $v0,$zero,1
    lui $at,%hi(D_8006928E)
    sh $s0,%lo(D_8006928E)($at)
    lui $at,%hi(D_80069290)
    sw $s1,%lo(D_80069290)($at)
    sh $v0,0($s2)
    lui $at,%hi(D_80069298)
    sw $zero,%lo(D_80069298)($at)
    lui $at,%hi(D_8006929C)
    sw $zero,%lo(D_8006929C)($at)
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end resource_context_reset
