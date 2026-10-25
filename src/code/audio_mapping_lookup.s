.text
.align 2
.set noreorder
.globl audio_mapping_lookup
.ent audio_mapping_lookup
audio_mapping_lookup:
    addiu $sp,$sp,-0x20
    sw $s2,0x18($sp)
    move $s2,$a1
    lui $a1,%hi(D_800740C4)
    lw $a1,%lo(D_800740C4)($a1)
    sw $ra,0x1c($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lhu $v0,0($a1)
    addiu $a2,$zero,11
    beqz $v0,.Ldone
     move $s0,$zero
    andi $s1,$a0,0xffff
    andi $v0,$s0,0xffff
.Lloop:
    sll $a0,$v0,2
    addu $v0,$a1,$a0
    lhu $v0,2($v0)
    bne $v0,$s1,.Lreload
     addiu $a0,$a0,2
    addu $a0,$a1,$a0
    jal func_8003FF30
     andi $a1,$s2,0xffff
    move $a2,$v0
.Lreload:
    lui $a1,%hi(D_800740C4)
    lw $a1,%lo(D_800740C4)($a1)
.Lnext:
    lhu $v1,0($a1)
    addiu $s0,$s0,1
    andi $v0,$s0,0xffff
    sltu $v0,$v0,$v1
    bnez $v0,.Lloop
     andi $v0,$s0,0xffff
.Ldone:
    move $v0,$a2
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_mapping_lookup
