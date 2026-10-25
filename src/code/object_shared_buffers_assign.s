.text
.align 2
.set noreorder
.globl object_shared_buffers_assign
.ent object_shared_buffers_assign
object_shared_buffers_assign:
    addiu $sp,$sp,-0x38
    sw $s2,0x28($sp)
    move $s2,$a0
    sw $ra,0x30($sp)
    sw $s3,0x2c($sp)
    sw $s1,0x24($sp)
    sw $s0,0x20($sp)
    lw $v0,0x78($s2)
    lw $s3,0x1c8($s2)
    blez $v0,.Ldone
     move $s0,$zero
    move $s1,$s3
.Louter:
    move $a0,$zero
    lw $a1,0x20($s1)
    blez $s0,.Lfound
     move $a2,$zero
    move $v1,$s3
.Linner:
    lw $v0,0x20($v1)
    bnel $a1,$v0,.Linner_next
     addiu $a0,$a0,1
    lw $a2,0x34($v1)
    j .Lfound
     nop
.Linner_next:
    slt $v0,$a0,$s0
    bnez $v0,.Linner
     addiu $v1,$v1,4
.Lfound:
    bnezl $a2,.Lassigned
     sw $a2,0x34($s1)
    jal func_8006056C
     move $a0,$s2
    move $a2,$v0
    sw $a2,0x34($s1)
.Lassigned:
    lw $v0,0x78($s2)
    addiu $s0,$s0,1
    slt $v0,$s0,$v0
    bnez $v0,.Louter
     addiu $s1,$s1,4
.Ldone:
    lw $ra,0x30($sp)
    lw $s3,0x2c($sp)
    lw $s2,0x28($sp)
    lw $s1,0x24($sp)
    lw $s0,0x20($sp)
    addiu $sp,$sp,0x38
    jr $ra
     nop
.end object_shared_buffers_assign
