.text
.align 2
.set noreorder
.globl object_cycle_advance
.ent object_cycle_advance
object_cycle_advance:
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x14($sp)
    lw $v0,0x19c($s0)
    bnez $v0,.Lstate
     nop
    jal func_8005848C
     nop
    beqz $v0,.Lreturn_zero
     move $v0,$zero
.Lstate:
    lw $v0,0x1b4($s0)
    lw $a1,0x58($v0)
    lw $v1,0x19c($s0)
    addiu $v0,$a1,0xd0
    beq $v1,$v0,.Ladvance
     addiu $v0,$zero,0x61
    lw $v0,0x14($s0)
    lw $v0,0x14($v0)
    jalr $v0
     move $a0,$s0
    bnez $v0,.Lcycle_update
     move $v0,$zero
    j .Ldone
     nop
.Ladvance:
    lw $v1,0($s0)
    sw $v0,0x14($v1)
    lw $v0,0x1b4($s0)
    lw $v1,0($s0)
    lw $v0,0x58($v0)
    sw $v0,0x18($v1)
    lw $v0,0($s0)
    lw $v0,4($v0)
    move $a0,$s0
    jalr $v0
     addiu $a1,$zero,3
    sw $zero,0x19c($s0)
.Lcycle_update:
    lw $a0,0x1b4($s0)
    lw $v1,0x58($a0)
    addiu $v0,$zero,1
    addiu $v1,$v1,1
    andi $v1,$v1,7
    sw $v1,0x58($a0)
.Lreturn_zero:
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end object_cycle_advance
