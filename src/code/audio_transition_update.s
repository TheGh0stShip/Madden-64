.text
.align 2
.set noreorder
.globl audio_transition_update
.ent audio_transition_update
audio_transition_update:
    lui $v1,0x8007
    lw $v1,0x12c8($v1)
    addiu $sp,$sp,-0x18
    addiu $v0,$zero,1
    beq $v1,$v0,.Lactive
     sw $ra,0x10($sp)
    beqz $v1,.Lidle_callback
     addiu $v0,$zero,2
    beq $v1,$v0,.Lidle
     addiu $v0,$zero,-1
    j .Ldone
     nop
.Lactive:
    lui $v1,0x8009
    lhu $v1,-0x5a4c($v1)
    lui $v0,0x8008
    lw $v0,0x6de0($v0)
    subu $v0,$v0,$v1
    lui $at,0x8008
    sw $v0,0x6de0($at)
    bgez $v0,.Ldone
     nop
    lui $a0,0x8008
    lw $a0,0x76c0($a0)
    jal func_8003D464
     nop
    addiu $v0,$zero,2
    lui $at,0x8007
    sw $v0,0x12c8($at)
    j .Ldone
     nop
.Lidle:
    lui $v1,0x8007
    lw $v1,0x34f8($v1)
    bne $v1,$v0,.Ldone
     nop
    lui $at,0x8007
    sw $zero,0x12c8($at)
.Lidle_callback:
    lui $a0,0x8004
    addiu $a0,$a0,0x1d24
    jal func_8002FFEC
     nop
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end audio_transition_update
