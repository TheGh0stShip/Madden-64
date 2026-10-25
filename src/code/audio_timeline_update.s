.text
.align 2
.set noreorder
.globl audio_timeline_update
.ent audio_timeline_update
audio_timeline_update:
    lui $a0,0x8007
    lw $a0,0x4d78($a0)
    addiu $sp,$sp,-0x20
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    beqz $a0,.Ldone
     sw $s0,0x10($sp)
    lui $v1,0x8009
    lhu $v1,-0x5a4c($v1)
    lw $v0,0($a0)
    lw $s1,8($a0)
    addu $v1,$v1,$v0
    sw $v1,0($a0)
    lhu $v0,4($s1)
    andi $v0,$v0,1
    bnez $v0,.Ldone
     nop
    lw $v0,0($s1)
    sltu $v0,$v1,$v0
    bnez $v0,.Lstore
     nop
    addiu $s0,$s1,4
.Lloop:
    lhu $a0,2($s0)
    lh $a1,4($s0)
    lh $a2,6($s0)
    jal func_8003CE88
     addiu $s0,$s0,0xc
    lhu $v0,0($s0)
    andi $v0,$v0,1
    bnez $v0,.Lstore_advance
     addiu $s1,$s1,0xc
    lui $v0,0x8007
    lw $v0,0x4d78($v0)
    lw $v1,0($s1)
    lw $v0,0($v0)
    sltu $v0,$v0,$v1
    beqz $v0,.Lloop
     nop
.Lstore_advance:
.Lstore:
    lui $v0,0x8007
    lw $v0,0x4d78($v0)
    sw $s1,8($v0)
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_timeline_update
