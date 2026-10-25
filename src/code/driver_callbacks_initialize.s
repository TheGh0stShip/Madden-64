.text
.align 2
.set noreorder
.globl driver_callbacks_initialize
.ent driver_callbacks_initialize
driver_callbacks_initialize:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    lw $v0,0x14($s0)
    bnez $v0,.Lconfigure
     move $s1,$a1
    lw $v0,4($s0)
    lw $v0,0($v0)
    move $a1,$zero
    jalr $v0
     addiu $a2,$zero,0x24
    sw $v0,0x14($s0)
    sw $s1,0x1c($v0)
.Lconfigure:
    lw $a0,0x14($s0)
    lui $v0,%hi(func_80055558)
    addiu $v0,$v0,%lo(func_80055558)
    sw $v0,8($a0)
    lui $v0,%hi(func_80055568)
    addiu $v0,$v0,%lo(func_80055568)
    sw $v0,0xc($a0)
    lui $v0,%hi(func_80055588)
    addiu $v0,$v0,%lo(func_80055588)
    sw $v0,0x10($a0)
    lui $v0,%hi(func_80058B08)
    addiu $v0,$v0,%lo(func_80058B08)
    sw $v0,0x14($a0)
    lui $v0,%hi(func_80055604)
    addiu $v0,$v0,%lo(func_80055604)
    sw $v0,0x18($a0)
    sw $zero,4($a0)
    sw $zero,0($a0)
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end driver_callbacks_initialize
