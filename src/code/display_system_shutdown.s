.text
.align 2
.set noreorder
.globl display_system_shutdown
.ent display_system_shutdown
display_system_shutdown:
    addiu $sp,$sp,-0x18
    lui $a0,0x8009
    addiu $a0,$a0,-0x4c30
    sw $ra,0x14($sp)
    jal func_8000C914
     sw $s0,0x10($sp)
    jal func_8000BE80
     nop
    lui $s0,0x8009
    addiu $s0,$s0,-0x4cb0
    lw $a1,0($s0)
    beqz $a1,.Lfirst_done
     nop
    jal func_80032F3C
     move $a0,$zero
    sw $zero,0($s0)
.Lfirst_done:
    lui $a1,0x8008
    lw $a1,0x4f44($a1)
    beqz $a1,.Lpool
     nop
    jal func_80032F3C
     move $a0,$zero
    lui $at,0x8008
    sw $zero,0x4f44($at)
    lui $at,0x8006
    sw $zero,0x4b80($at)
.Lpool:
    lui $a0,0x8006
    lw $a0,0x4ba0($a0)
    beqz $a0,.Lbuffer
     nop
    jal func_80033258
     nop
    lui $at,0x8006
    sw $zero,0x4ba0($at)
.Lbuffer:
    lui $a1,0x8008
    lw $a1,0x5038($a1)
    beqz $a1,.Lfinal
     nop
    jal func_80032F3C
     move $a0,$zero
    lui $at,0x8008
    sw $zero,0x5038($at)
    lui $at,0x8009
    sw $zero,-0x5068($at)
.Lfinal:
    lui $a0,0x8009
    lw $a0,-0x49f4($a0)
    beqz $a0,.Ldone
     nop
    jal func_80008E48
     nop
    lui $at,0x8009
    sw $zero,-0x49f4($at)
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end display_system_shutdown
