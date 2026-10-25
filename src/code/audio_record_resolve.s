.text
.align 2
.set noreorder
.globl audio_record_resolve
.ent audio_record_resolve
audio_record_resolve:
    lui $v1,%hi(D_80086DD8)
    lw $v1,%lo(D_80086DD8)($v1)
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    move $s0,$a0
    lui $v0,%hi(D_800908B8)
    addiu $v0,$v0,%lo(D_800908B8)
    bne $v1,$v0,.Lload
     sw $ra,0x14($sp)
    lui $a1,%hi(D_800C5098)
    addiu $a1,$a1,%lo(D_800C5098)
    j .Lresolved
     nop
.Lload:
    lui $a0,%hi(D_80002980)
    addiu $a0,$a0,%lo(D_80002980)
    jal func_80037108
     addiu $a1,$zero,1
    move $a1,$v0
.Lresolved:
    lb $v0,4($a1)
    sll $v1,$v0,1
    addu $v1,$v1,$v0
    sll $v0,$v1,4
    subu $v0,$v0,$v1
    sll $v0,$v0,1
    addiu $v0,$v0,0x42
    addu $v1,$a1,$v0
    sll $v0,$s0,16
    sra $v0,$v0,16
    sll $a0,$v0,1
    addu $a0,$a0,$v0
    sll $a0,$a0,1
    jal func_80036E1C
     addu $a0,$v1,$a0
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end audio_record_resolve
