.text
.align 2
.set noreorder
.globl audio_channel_replace
.ent audio_channel_replace
audio_channel_replace:
    addiu $sp,$sp,-0x28
    sw $s2,0x18($sp)
    andi $s2,$a0,0xbfff
    sll $v0,$s2,1
    addu $v0,$v0,$s2
    sw $s1,0x14($sp)
    sll $s1,$v0,3
    sw $ra,0x20($sp)
    sw $s3,0x1c($sp)
    sw $s0,0x10($sp)
    lui $at,%hi(D_8008B080)
    addu $at,$at,$s1
    lw $v0,%lo(D_8008B080)($at)
    addu $s0,$a1,$zero
    beqz $v0,.Lreplace
     addu $s3,$a2,$zero
    jal func_80036540
     addu $a0,$zero,$zero
.Lreplace:
    lui $at,%hi(D_8008B080)
    addu $at,$at,$s1
    sw $s3,%lo(D_8008B080)($at)
    ori $a0,$s2,0x4000
    jal func_80036A24
     andi $a1,$s0,0x3f
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end audio_channel_replace
