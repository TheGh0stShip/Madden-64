.text
.align 2
.set noreorder
.globl object_children_allocate
.ent object_children_allocate
object_children_allocate:
    addiu $sp,$sp,-0x30
    sw $s0,0x18($sp)
    addu $s0,$a0,$zero
    sw $s1,0x1c($sp)
    addu $s1,$zero,$zero
    sw $ra,0x28($sp)
    sw $s3,0x24($sp)
    sw $s2,0x20($sp)
    lw $v0,0x70($s0)
    lw $a0,0x1c8($s0)
    lw $v1,0x78($s0)
    addiu $v0,$v0,2
    blez $v1,.Lreturn
     sll $s3,$v0,1
    addu $s2,$a0,$zero
.Lloop:
    lw $v0,4($s0)
    addu $a0,$s0,$zero
    lw $v0,4($v0)
    addiu $a1,$zero,1
    jalr $v0
     addu $a2,$s3,$zero
    sw $v0,0x44($s2)
    lw $v0,0x78($s0)
    addiu $s1,$s1,1
    slt $v0,$s1,$v0
    bnez $v0,.Lloop
     addiu $s2,$s2,4
.Lreturn:
    lw $ra,0x28($sp)
    lw $s3,0x24($sp)
    lw $s2,0x20($sp)
    lw $s1,0x1c($sp)
    lw $s0,0x18($sp)
    addiu $sp,$sp,0x30
    jr $ra
     nop
.end object_children_allocate
