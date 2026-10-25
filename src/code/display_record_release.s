.text
.align 2
.set noreorder
.globl display_record_release
.ent display_record_release
display_record_release:
    lui $a1,0x8007
    lw $a1,-0x6d54($a1)
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    lw $s1,8($s0)
    lui $a2,0x8008
    addiu $a2,$a2,-0x6b84
    addiu $a1,$a1,-1
    lw $v0,0x14($s1)
    sll $v1,$a1,2
    addu $v1,$v1,$a2
    lw $a0,0($v1)
    sll $v0,$v0,2
    addu $v0,$v0,$a2
    sw $a0,0($v0)
    lw $v0,0($v1)
    lw $v1,8($v0)
    lw $v0,0x14($s1)
    sw $v0,0x14($v1)
    lw $a0,0x18($s1)
    lui $at,0x8007
    sw $a1,-0x6d54($at)
    jal func_8000D684
     nop
    move $a0,$s0
    jal func_8001B410
     move $a1,$s1
    lw $a1,0x24($s1)
    beqz $a1,.Lsecond
     nop
    jal func_80032F3C
     move $a0,$zero
    lw $a1,0x28($s1)
    jal func_80032F3C
     move $a0,$zero
.Lsecond:
    lw $a1,0x20($s1)
    beqz $a1,.Ldone
     nop
    jal func_80032F3C
     move $a0,$zero
    lw $a1,0x2c($s1)
    jal func_80032F3C
     move $a0,$zero
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end display_record_release
