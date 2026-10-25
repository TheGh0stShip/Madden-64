.text
.align 2
.set noreorder
.globl object_state_finalize
.ent object_state_finalize
object_state_finalize:
    addiu $sp,$sp,-0x28
    sw $s0,0x18($sp)
    move $s0,$a0
    sw $ra,0x20($sp)
    sw $s1,0x1c($sp)
    lw $s1,0x1b8($s0)
    lw $v1,0xc($s1)
    lw $a0,0x1b4($s0)
    bltzl $v1,.Lrounded
     addiu $v1,$v1,7
.Lrounded:
    lw $v0,0x5c($a0)
    sra $v1,$v1,3
    addu $v0,$v0,$v1
    sw $v0,0x5c($a0)
    sw $zero,0xc($s1)
    lw $v0,0x1b4($s0)
    lw $v0,8($v0)
    jalr $v0
     move $a0,$s0
    beqz $v0,.Lreturn
     move $v0,$zero
    lw $v0,0x144($s0)
    blez $v0,.Lafter_loop
     move $v1,$zero
    move $a0,$s1
.Lloop:
    sw $zero,0x18($a0)
    lw $v0,0x144($s0)
    addiu $v1,$v1,1
    slt $v0,$v1,$v0
    bnez $v0,.Lloop
     addiu $a0,$a0,4
.Lafter_loop:
    sw $zero,0x14($s1)
    lw $v1,0x114($s0)
    addiu $v0,$zero,1
    sw $zero,0x10($s1)
    sw $v1,0x28($s1)
.Lreturn:
    lw $ra,0x20($sp)
    lw $s1,0x1c($sp)
    lw $s0,0x18($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end object_state_finalize
