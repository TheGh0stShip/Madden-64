.text
.align 2
.set noreorder
.globl roster_value_ratio_secondary
.ent roster_value_ratio_secondary
roster_value_ratio_secondary:
    addiu $sp,$sp,-0x20
    sw $s2,0x18($sp)
    move $s2,$a1
    sw $s1,0x14($sp)
    andi $s1,$a0,0xffff
    move $a0,$s1
    andi $a1,$a2,0xffff
    sw $ra,0x1c($sp)
    jal func_800241A0
     sw $s0,0x10($sp)
    sll $v0,$v0,16
    sra $s0,$v0,16
    beqz $s0,.Lzero
     move $a0,$s1
    jal func_800241A0
     andi $a1,$s2,0xffff
    sll $v1,$v0,16
    sra $v1,$v1,16
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $v0,$v0,3
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    div $zero,$v0,$s0
    bnez $s0,.Ldiv_ok
     nop
    break 7
.Ldiv_ok:
    addiu $at,$zero,-1
    bne $s0,$at,.Lquotient
     lui $at,0x8000
    bne $v0,$at,.Lquotient
     nop
    break 6
.Lquotient:
    mflo $v0
    sll $v0,$v0,16
    j .Lreturn
     sra $v0,$v0,16
.Lzero:
    move $v0,$zero
.Lreturn:
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end roster_value_ratio_secondary
