.text
.align 2
.set noreorder
.globl object_active_children_update
.ent object_active_children_update
object_active_children_update:
    lui $v0,%hi(D_8008A5B4)
    lhu $v0,%lo(D_8008A5B4)($v0)
    addiu $sp,$sp,-0x20
    sw $s1,0x14($sp)
    move $s1,$a0
    sw $s0,0x10($sp)
    move $s0,$zero
    sltu $v0,$s0,$v0
    beqz $v0,.Ldone
     sw $ra,0x18($sp)
.Lloop:
    lbu $v1,0x240($s1)
    slti $v0,$v1,2
    beqz $v0,.Lnext
     nop
    bltz $v1,.Lnext
     nop
    jal func_8000D01C
     move $a0,$s1
.Lnext:
    lui $v0,%hi(D_8008A5B4)
    lhu $v0,%lo(D_8008A5B4)($v0)
    addiu $s0,$s0,1
    sltu $v0,$s0,$v0
    bnez $v0,.Lloop
     nop
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end object_active_children_update
