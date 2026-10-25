.text
.align 2
.set noreorder
.globl audio_entry_dispatch_secondary
.ent audio_entry_dispatch_secondary
audio_entry_dispatch_secondary:
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    andi $s0,$a0,0xffff
    lui $v0,%hi(D_8007473C)
    addiu $v0,$v0,%lo(D_8007473C)
    sll $s0,$s0,2
    addu $s0,$s0,$v0
    sw $ra,0x14($sp)
    lw $v0,0($s0)
    lhu $a0,0($v0)
    jal func_80031A1C
     nop
    sll $v0,$v0,1
    lw $v1,0($s0)
    andi $v0,$v0,0xffff
    sll $v0,$v0,1
    addu $v1,$v0,$v1
    lhu $a0,2($v1)
    addiu $v0,$a0,1
    beqz $v0,.Ldone
     nop
    lh $a1,4($v1)
    jal func_8003D074
     nop
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end audio_entry_dispatch_secondary
