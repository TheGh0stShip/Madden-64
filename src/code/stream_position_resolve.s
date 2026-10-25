.text
.align 2
.set noreorder
.globl stream_position_resolve
.ent stream_position_resolve
stream_position_resolve:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    lw $v0,0($s0)
    lw $v0,0x18($v0)
    move $s2,$a2
    lw $a2,0($v0)
    move $s1,$a1
    move $a1,$a3
    sltu $v0,$a1,$a2
    bnez $v0,.Lresolve
     move $a0,$s0
    lui $a0,0x8000
    addiu $a0,$a0,0x2fa0
    jal func_8002CA88
     nop
    lw $v0,0x18($s0)
    lbu $a1,6($v0)
    lui $a0,0x8000
    addiu $a0,$a0,0x2fdc
    jal func_8002CA88
     nop
    lw $v0,0($s0)
    lw $v0,0x18($v0)
    lw $v0,0($v0)
    addiu $a1,$v0,-1
    move $a0,$s0
.Lresolve:
    jal func_800430F4
     andi $a1,$a1,0xffff
    sw $v0,0($s1)
    move $v0,$zero
    sw $zero,0($s2)
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end stream_position_resolve
