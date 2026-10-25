.text
.align 2
.set noreorder
.globl audio_slots_release_all
.ent audio_slots_release_all
audio_slots_release_all:
    addiu $sp,$sp,-0x28
    sw $ra,0x24($sp)
    sw $s4,0x20($sp)
    sw $s3,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    jal func_8003F28C
     sw $s0,0x10($sp)
    move $s1,$zero
    ori $s2,$zero,0xffff
    lui $s3,0x8008
    addiu $s3,$s3,0x2d84
    addiu $s4,$s3,0x214c
    sll $v0,$s1,16
.Lloop:
    sra $s0,$v0,14
    lui $at,0x8008
    addu $at,$at,$s0
    lhu $v0,0x2d84($at)
    beq $v0,$s2,.Lsecond
     nop
    jal func_800400F4
     addu $a0,$s0,$s3
.Lsecond:
    lui $at,0x8008
    addu $at,$at,$s0
    lhu $v0,0x4ed0($at)
    beq $v0,$s2,.Lnext
     addiu $v0,$s1,1
    jal func_800400F4
     addu $a0,$s0,$s4
    addiu $v0,$s1,1
.Lnext:
    move $s1,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,4
    bnez $v0,.Lloop
     sll $v0,$s1,16
.Ldone:
    lw $ra,0x24($sp)
    lw $s4,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end audio_slots_release_all
