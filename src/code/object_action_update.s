.text
.align 2
.set noreorder
.globl object_action_update
.ent object_action_update
object_action_update:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    lw $v0,0x10($s0)
    addiu $v0,$v0,-0xc8
    sltiu $v0,$v0,2
    bnez $v0,.Ldispatch_done
     move $s2,$a1
    lw $v1,0($s0)
    addiu $v0,$zero,0x12
    sw $v0,0x14($v1)
    lw $v1,0($s0)
    lw $v0,0x10($s0)
    sw $v0,0x18($v1)
    lw $v0,0($s0)
    lw $v0,0($v0)
    jalr $v0
     nop
.Ldispatch_done:
    jal func_8005527C
     move $a0,$s0
    move $s1,$v0
    addiu $v0,$zero,1
    beq $s1,$v0,.Lmove_return
     slti $v0,$s1,2
    bnez $v0,.Lrestore
     move $v0,$s1
    addiu $v0,$zero,2
    bnel $s1,$v0,.Lrestore
     move $v0,$s1
    beqz $s2,.Lfinalize
     addiu $v0,$zero,0x32
    lw $v1,0($s0)
    sw $v0,0x14($v1)
    lw $v0,0($s0)
    lw $v0,0($v0)
    jalr $v0
     move $a0,$s0
.Lfinalize:
    jal func_80063318
     move $a0,$s0
.Lmove_return:
    move $v0,$s1
.Lrestore:
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end object_action_update
