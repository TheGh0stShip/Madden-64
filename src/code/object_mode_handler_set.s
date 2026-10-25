.text
.align 2
.set noreorder
.globl object_mode_handler_set
.ent object_mode_handler_set
object_mode_handler_set:
    addiu $sp,$sp,-0x18
    sw $ra,0x14($sp)
    sw $s0,0x10($sp)
    lw $s0,0x1a4($a0)
    beqz $a1,.Lmode_zero
     addiu $v0,$zero,2
    beq $a1,$v0,.Lmode_two
     addiu $v0,$zero,4
    j .Ldefault
     nop
.Lmode_zero:
    lw $v0,0x1c0($a0)
    lw $v0,8($v0)
    beqz $v0,.Lmode_zero_simple
     nop
    lui $v0,0x8006
    addiu $v0,$v0,-0x4d88
    jal func_8005ACDC
     sw $v0,4($s0)
    sw $zero,0x40($s0)
    sw $zero,0x44($s0)
    j .Lcommon
     sw $zero,0x4c($s0)
.Lmode_zero_simple:
    lui $v0,0x8006
    addiu $v0,$v0,-0x4e4c
    sw $v0,4($s0)
.Lcommon:
    sw $zero,0x30($s0)
    j .Ldone
     sw $zero,0x34($s0)
.Lmode_two:
    lui $v0,0x8006
    addiu $v0,$v0,-0x4bb0
    j .Ldone
     sw $v0,4($s0)
.Ldefault:
    lw $v1,0($a0)
    sw $v0,0x14($v1)
    lw $v0,0($a0)
    lw $v0,0($v0)
    jalr $v0
     nop
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end object_mode_handler_set
