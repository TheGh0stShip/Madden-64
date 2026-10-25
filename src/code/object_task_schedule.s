.text
.align 2
.set noreorder
.globl object_task_schedule
.ent object_task_schedule
object_task_schedule:
    addiu $sp,$sp,-0x40
    sw $s1,0x24($sp)
    move $s1,$a0
    sw $ra,0x38($sp)
    sw $s5,0x34($sp)
    sw $s4,0x30($sp)
    sw $s3,0x2c($sp)
    sw $s2,0x28($sp)
    sw $s0,0x20($sp)
    lw $s2,0x1a4($s1)
    move $s3,$a1
    lw $v0,0x30($s2)
    move $s4,$a2
    bnez $v0,.Lsubmit
     move $s5,$a3
    lw $v0,0x1a8($s1)
    lw $v0,0xc($v0)
    jalr $v0
     addiu $a1,$s2,8
    beqz $v0,.Ldone
     addiu $v0,$zero,1
    sw $v0,0x30($s2)
.Lsubmit:
    lw $s0,0x138($s1)
    lw $v0,0x1ac($s1)
    move $a0,$s1
    addiu $a1,$s2,8
    sw $s3,0x10($sp)
    sw $s4,0x14($sp)
    sw $s5,0x18($sp)
    lw $v0,4($v0)
    addiu $a2,$s2,0x34
    jalr $v0
     move $a3,$s0
    lw $v0,0x34($s2)
    sltu $v0,$v0,$s0
    bnez $v0,.Ldone
     nop
    sw $zero,0x30($s2)
    sw $zero,0x34($s2)
.Ldone:
    lw $ra,0x38($sp)
    lw $s5,0x34($sp)
    lw $s4,0x30($sp)
    lw $s3,0x2c($sp)
    lw $s2,0x28($sp)
    lw $s1,0x24($sp)
    lw $s0,0x20($sp)
    addiu $sp,$sp,0x40
    jr $ra
     nop
.end object_task_schedule
