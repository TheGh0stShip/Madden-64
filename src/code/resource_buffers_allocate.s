.text
.align 2
.set noreorder
.globl resource_buffers_allocate
.ent resource_buffers_allocate
resource_buffers_allocate:
    addiu $sp,$sp,-0x30
    sw $s2,0x28($sp)
    move $s2,$a1
    sw $ra,0x2c($sp)
    sw $s1,0x24($sp)
    sw $s0,0x20($sp)
    lw $a0,0x10($s2)
    addiu $a1,$sp,0x10
    sw $zero,0x30($s2)
    jal func_8001C6B8
     sw $zero,0x34($s2)
    lhu $v0,0x12($sp)
    lhu $v1,0x10($sp)
    lhu $a0,0x14($sp)
    addu $v0,$v0,$v1
    addu $s1,$v0,$a0
    beqz $s1,.Ldone
     sw $s1,0x38($s2)
    sll $s1,$s1,7
    move $a0,$zero
    move $a1,$s1
    jal func_800337CC
     addiu $a2,$zero,0x10
    move $a0,$zero
    move $s0,$v0
    move $a1,$s0
    move $a2,$s1
    move $a3,$zero
    jal func_80033308
     sw $s0,0x30($s2)
    srl $s1,$s1,1
    addu $s0,$s0,$s1
    sw $s0,0x34($s2)
.Ldone:
    lw $ra,0x2c($sp)
    lw $s2,0x28($sp)
    lw $s1,0x24($sp)
    lw $s0,0x20($sp)
    addiu $sp,$sp,0x30
    jr $ra
     nop
.end resource_buffers_allocate
