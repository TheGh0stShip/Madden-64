.text
.align 2
.set noreorder
.globl object_animation_activate
.ent object_animation_activate
object_animation_activate:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    lw $v1,0x10($s0)
    lw $s1,0x1a0($s0)
    addiu $v0,$zero,0xcf
    beq $v1,$v0,.Lchecks
     addiu $v0,$zero,0x12
    lw $v1,0($s0)
    sw $v0,0x14($v1)
    lw $v1,0($s0)
    lw $v0,0x10($s0)
    sw $v0,0x18($v1)
    lw $v0,0($s0)
    lw $v0,0($v0)
    jalr $v0
     nop
.Lchecks:
    lw $v0,0x54($s0)
    beqz $v0,.Lfallback
     nop
    lw $v0,0x68($s0)
    beqz $v0,.Lfallback
     nop
    lw $v0,0x88($s0)
    beqz $v0,.Lfallback
     nop
    lw $v0,0x18($s1)
    sw $v0,0x1c8($s0)
    lw $v0,0xc($v0)
    jalr $v0
     move $a0,$s0
    j .Ldone
     sw $zero,8($s1)
.Lfallback:
    lw $v1,0($s0)
    addiu $v0,$zero,0x2d
    sw $v0,0x14($v1)
    lw $v0,0($s0)
    lw $v0,0($v0)
    jalr $v0
     move $a0,$s0
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end object_animation_activate
