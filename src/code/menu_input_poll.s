.text
.align 2
.set noreorder
.globl menu_input_poll
.ent menu_input_poll
menu_input_poll:
    lui $v0,%hi(D_80080C10)
    lw $v0,%lo(D_80080C10)($v0)
    addiu $sp,$sp,-0x18
    andi $v0,$v0,0x4000
    bnez $v0,.Ldone
     sw $ra,0x10($sp)
    lui $v0,%hi(D_800894FC)
    lh $v0,%lo(D_800894FC)($v0)
    bnez $v0,.Ldone
     nop
    lui $v0,%hi(D_8006B7A8)
    lhu $v0,%lo(D_8006B7A8)($v0)
    bnez $v0,.Ldone
     nop
    lhu $v0,0x28($a0)
    andi $v0,$v0,8
    beqz $v0,.Ldone
     nop
    lh $v0,0x30($a0)
    blez $v0,.Ldone
     nop
    lw $v0,0x24($a0)
    lui $v1,%hi(D_80086178)
    lw $v1,%lo(D_80086178)($v1)
    lw $a1,0x38($a0)
    lw $a2,0x20($v0)
    lw $a3,0x20($v1)
    jal func_8001FA68
     addiu $a0,$zero,0xc
    sll $v0,$v0,16
    sra $v0,$v0,16
    addiu $v1,$zero,1
    bne $v0,$v1,.Ldone
     addiu $a0,$zero,0x2d
    jal func_8009CBB8
     addiu $a1,$zero,0xd2
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end menu_input_poll
