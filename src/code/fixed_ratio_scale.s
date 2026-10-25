.text
.align 2
.set noreorder
.globl fixed_ratio_scale
.ent fixed_ratio_scale
fixed_ratio_scale:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    addu $s0,$a0,$zero
    sw $s1,0x14($sp)
    addu $s1,$a1,$zero
    sra $a1,$a1,8
    bnez $a1,.Ldivide
     sw $ra,0x18($sp)
    lui $a0,%hi(D_80001550)
    addiu $a0,$a0,%lo(D_80001550)
    jal func_8002CA88
     sll $s0,$s0,8
    bltzl $s1,.Learly_return
     negu $s0,$s0
.Learly_return:
    j .Lreturn
     addu $v0,$s0,$zero
.Ldivide:
    div $zero,$s0,$a1
    bnez $a1,.Ldivisor_ok
     nop
    break 7
.Ldivisor_ok:
    addiu $at,$zero,-1
    bne $a1,$at,.Lquotient
     lui $at,0x8000
    bne $s0,$at,.Lquotient
     nop
    break 6
.Lquotient:
    mflo $s0
.Lresult:
    sll $v0,$s0,8
.Lreturn:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end fixed_ratio_scale
