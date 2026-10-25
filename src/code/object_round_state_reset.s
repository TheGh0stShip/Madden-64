.text
.align 2
.set noreorder
.globl object_round_state_reset
.ent object_round_state_reset
object_round_state_reset:
    move $s0,$a0
    sw $ra,0x14($sp)
    lw $v1,0($s0)
    addiu $v0,$zero,0x65
    sw $v0,0x14($v1)
    lw $v0,0($s0)
    lw $v0,4($v0)
    jalr $v0
     addiu $a1,$zero,1
    lw $v0,0x1b4($s0)
    lw $v0,0x50($v0)
    beqz $v0,.Larray
     addiu $v0,$zero,0x3c
    lw $v1,0($s0)
    sw $v0,0x14($v1)
    lw $v0,0($s0)
    lw $v0,0($v0)
    jalr $v0
     move $a0,$s0
.Larray:
    move $v1,$zero
    addiu $a1,$zero,1
    addiu $a0,$zero,5
    addu $v0,$s0,$v1
.Lloop:
    addiu $v1,$v1,1
    sb $zero,0xe4($v0)
    sb $a1,0xf4($v0)
    sb $a0,0x104($v0)
    slti $v0,$v1,0x10
    bnez $v0,.Lloop
     addu $v0,$s0,$v1
.Lafter:
    lw $v1,0x1b4($s0)
    addiu $v0,$zero,1
    sh $v0,0x11e($s0)
    sh $v0,0x120($s0)
    addiu $v0,$zero,1
    sw $zero,0x114($s0)
    sw $zero,0x24($s0)
    sw $zero,0x12c($s0)
    sw $zero,0x118($s0)
    sb $zero,0x11c($s0)
    sw $zero,0x124($s0)
    sb $zero,0x128($s0)
    sw $v0,0x50($v1)
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end object_round_state_reset
