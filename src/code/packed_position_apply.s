.text
.align 2
.set noreorder
.globl packed_position_apply
.ent packed_position_apply
packed_position_apply:
    addiu $sp,$sp,-0x18
    move $a2,$a0
    srl $v0,$a2,24
    lui $v1,%hi(D_8006929C)
    lw $v1,%lo(D_8006929C)($v1)
    sll $v0,$v0,2
    sw $ra,0x14($sp)
    sw $s0,0x10($sp)
    addu $v0,$v0,$v1
    lw $s0,0($v0)
    andi $v0,$a0,0x800
    beqz $v0,.Lx_ready
     andi $a2,$a2,0xfff
    addiu $v0,$zero,-0x1000
    or $a2,$a2,$v0
.Lx_ready:
    sra $a1,$a0,12
    andi $a1,$a1,0xfff
    andi $v0,$a1,0x800
    beqz $v0,.Ly_ready
     addiu $v0,$zero,-0x1000
    or $a1,$a1,$v0
.Ly_ready:
    move $a0,$s0
    sll $a1,$a1,16
    sll $a2,$a2,16
    sra $a1,$a1,16
    jal func_80017000
     sra $a2,$a2,16
    jal func_80018540
     move $a0,$s0
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end packed_position_apply
