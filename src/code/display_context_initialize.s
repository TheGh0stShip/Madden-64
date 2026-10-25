.text
.align 2
.set noreorder
.globl display_context_initialize
.ent display_context_initialize
display_context_initialize:
    lui $v0,%hi(D_8008AFD4)
    lhu $v0,%lo(D_8008AFD4)($v0)
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    lui $s0,%hi(D_80074A80)
    addiu $s0,$s0,%lo(D_80074A80)
    sw $ra,0x14($sp)
    lw $a0,0($s0)
    lui $a1,%hi(D_80074A78)
    lw $a1,%lo(D_80074A78)($a1)
    sll $v0,$v0,2
    lui $at,0x8008
    addu $at,$at,$v0
    lw $v1,-0x54f0($at)
    lui $at,0x8008
    addu $at,$at,$v0
    lw $v0,-0x54e4($at)
    lui $at,%hi(D_8007AB18)
    sw $v1,%lo(D_8007AB18)($at)
    lui $at,%hi(D_8007AB24)
    sw $v0,%lo(D_8007AB24)($at)
    jal func_8002E7A0
     nop
    lw $a0,0($s0)
    lui $a1,%hi(D_80074A7C)
    lw $a1,%lo(D_80074A7C)($a1)
    lui $at,%hi(D_8007AB04)
    sw $v0,%lo(D_8007AB04)($at)
    jal func_8002E7A0
     nop
    lui $at,%hi(D_8007AB08)
    sw $v0,%lo(D_8007AB08)($at)
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end display_context_initialize
