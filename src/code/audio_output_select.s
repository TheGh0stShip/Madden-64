.text
.align 2
.set noreorder
.globl audio_output_select
.ent audio_output_select
audio_output_select:
    lui $v0,0x8007
    lw $v0,0x34e8($v0)
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $s1,0x14($sp)
    move $s1,$a1
    bnez $v0,.Lcheck
     sw $ra,0x18($sp)
    lui $a0,0x8000
    addiu $a0,$a0,0x400
    jal func_800356C4
     addiu $a1,$zero,0x48
    lui $at,0x8008
    sh $v0,-0x5acc($at)
    addiu $v0,$zero,1
    lui $at,0x8007
    sw $v0,0x34e8($at)
.Lcheck:
    lui $at,0x8008
    addu $at,$at,$s0
    lbu $v0,-0x5ad0($at)
    beq $v0,$s1,.Lpost_change
     sll $v0,$s0,2
    lui $at,0x8007
    addu $at,$at,$v0
    lw $v0,0x34f0($at)
    lui $at,0x8008
    addu $at,$at,$s0
    sb $s1,-0x5ad0($at)
    lui $a0,0x8008
    lhu $a0,-0x5acc($a0)
    lw $a2,0($v0)
    jal func_80036268
     move $a1,$s1
.Lpost_change:
    lui $a0,0x8008
    lhu $a0,-0x5acc($a0)
    jal func_80035598
     move $a1,$s1
    lui $v1,0x8007
    addiu $v1,$v1,0x34f0
    sll $s0,$s0,2
    addu $s0,$s0,$v1
    lw $v1,0($s0)
    lw $a0,0($v1)
    move $s1,$v0
    jal func_8004F158
     move $a1,$s1
    lw $v0,0($s0)
    lw $a0,0($v0)
    jal func_80046DA8
     move $a1,$s1
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_output_select
