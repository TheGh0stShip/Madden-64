.text
.align 2
.set noreorder
.globl audio_vectors_transform
.ent audio_vectors_transform
audio_vectors_transform:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    lw $a0,0x24($s0)
    move $s2,$a1
    beqz $a0,.L1
     move $s1,$a2
    move $a1,$s1
    jal func_80040A44
     move $a2,$s2
.L1:
    lw $a0,0x28($s0)
    beqz $a0,.L2
     addiu $a1,$s1,4
    jal func_80040A44
     addiu $a2,$s2,4
.L2:
    lw $a0,0x2c($s0)
    beqz $a0,.L3
     addiu $a1,$s1,8
    jal func_80040A44
     addiu $a2,$s2,8
.L3:
    lw $a0,0x30($s0)
    beqz $a0,.L4
     addiu $a1,$s1,0xc
    jal func_80040C04
     addiu $a2,$s2,0xc
.L4:
    lw $a0,0x34($s0)
    beqz $a0,.L5
     addiu $a1,$s1,0x10
    jal func_80040C04
     addiu $a2,$s2,0x10
.L5:
    lw $a0,0x38($s0)
    beqz $a0,.L6
     addiu $a1,$s1,0x14
    jal func_80040C04
     addiu $a2,$s2,0x14
.L6:
    lw $a0,0x3c($s0)
    beqz $a0,.L7
     addiu $a1,$s1,0x18
    jal func_80040D0C
     addiu $a2,$s2,0x18
.L7:
    lw $a0,0x40($s0)
    beqz $a0,.L8
     addiu $a1,$s1,0x1c
    jal func_80040D0C
     addiu $a2,$s2,0x1c
.L8:
    lw $a0,0x44($s0)
    beqz $a0,.Ldone
     addiu $a1,$s1,0x20
    jal func_80040D0C
     addiu $a2,$s2,0x20
.Ldone:
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_vectors_transform
