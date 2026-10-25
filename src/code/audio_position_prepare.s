.text
.align 2
.set noreorder
.globl audio_position_prepare
.ent audio_position_prepare
audio_position_prepare:
    move $t0,$a0
    lui $a0,0x8007
    lw $a0,0x3508($a0)
    addiu $sp,$sp,-0x18
    move $a3,$a2
    beqz $a0,.Ldone
     sw $ra,0x10($sp)
    sll $v0,$a1,16
    sra $v0,$v0,16
    sll $v1,$a0,2
    addu $v1,$v1,$a0
    sll $v1,$v1,1
    sll $a0,$v0,1
    addu $a0,$a0,$v0
    addu $v1,$v1,$a0
    addiu $v1,$v1,0x3c
    move $a2,$v1
    sll $v1,$v1,16
    sra $v1,$v1,16
    lui $at,0x8008
    sw $t0,0x5108($at)
    lui $at,0x8009
    sw $v0,-0x4734($at)
    bltzl $v1,.Lrounded
     addiu $v1,$v1,0xf
.Lrounded:
    sll $v0,$a3,16
    sra $v0,$v0,16
    slti $v0,$v0,0x10
    beqz $v0,.Lupper
     sra $v1,$v1,4
    move $a1,$a2
    mult $v1,$a3
    mflo $a2
    j .Lcheck
     nop
.Lupper:
    addiu $v0,$zero,0x20
    subu $v0,$v0,$a3
    mult $v1,$v0
    mflo $a1
.Lcheck:
    lui $at,0x8008
    addu $at,$at,$t0
    lb $v0,0x7b10($at)
    bgez $v0,.Ldone
     sll $a1,$a1,16
    sll $a2,$a2,16
    move $a0,$t0
    sra $a1,$a1,16
    jal func_8003D8F4
     sra $a2,$a2,16
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end audio_position_prepare
