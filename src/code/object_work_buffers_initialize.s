.text
.align 2
.set noreorder
.globl object_work_buffers_initialize
.ent object_work_buffers_initialize
object_work_buffers_initialize:
    addiu $sp,$sp,-0x20
    sw $s0,0x18($sp)
    move $s0,$a0
    sw $ra,0x1c($sp)
    lw $v0,4($s0)
    lw $v0,0($v0)
    addiu $a1,$zero,1
    jalr $v0
     addiu $a2,$zero,0x40
    addiu $a0,$zero,3
    addiu $a1,$v0,0xc
    lui $v1,0x8006
    addiu $v1,$v1,-0x6588
    sw $v0,0x1b8($s0)
    sw $v1,0($v0)
.Lheader_loop:
    sw $zero,0x2c($a1)
    addiu $a0,$a0,-1
    bgez $a0,.Lheader_loop
     addiu $a1,$a1,-4
    lw $v0,4($s0)
    addiu $a1,$zero,1
    lw $a2,0x20($s0)
    lw $v0,0($v0)
    move $a0,$s0
    jalr $v0
     sll $a2,$a2,8
    lw $v1,0x20($s0)
    move $a1,$v0
    move $a2,$zero
    blez $v1,.Ldone
     sw $a1,0xa0($s0)
.Louter:
    addiu $v1,$zero,-1
    addiu $a0,$zero,0x3f
.Linner:
    sw $v1,0($a1)
    addiu $a0,$a0,-1
    bgez $a0,.Linner
     addiu $a1,$a1,4
    lw $v0,0x20($s0)
    addiu $a2,$a2,1
    slt $v0,$a2,$v0
    bnez $v0,.Linner
     addiu $a0,$zero,0x3f
.Ldone:
    lw $ra,0x1c($sp)
    lw $s0,0x18($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end object_work_buffers_initialize
