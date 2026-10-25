.text
.align 2
.set noreorder
.globl display_flags_accumulate
.ent display_flags_accumulate
display_flags_accumulate:
    lui $v0,%hi(D_80086DA8)
    lh $v0,%lo(D_80086DA8)($v0)
    addiu $sp,$sp,-0x28
    sw $s1,0x1c($sp)
    move $s1,$zero
    sw $s0,0x18($sp)
    move $s0,$zero
    blez $v0,.Lfiltered
     sw $ra,0x20($sp)
    sll $a0,$s1,16
.Lloop:
    jal func_80030B54
     sra $a0,$a0,16
    or $s0,$s0,$v0
    addiu $v0,$s1,1
    move $s1,$v0
    lui $v1,%hi(D_80086DA8)
    lh $v1,%lo(D_80086DA8)($v1)
    sll $v0,$v0,16
    sra $v0,$v0,16
    slt $v0,$v0,$v1
    bnel $v0,$zero,.Lloop
     sll $a0,$s1,16
.Lfiltered:
    andi $v0,$s0,0x800
    beqz $v0,.Lsecond
     addiu $v0,$zero,-0x401
    and $s0,$s0,$v0
.Lsecond:
    andi $v0,$s0,0x200
    beqz $v0,.Lreturn
     addiu $v0,$zero,-0x101
    and $s0,$s0,$v0
.Lreturn:
    move $v0,$s0
    lw $ra,0x20($sp)
    lw $s1,0x1c($sp)
    lw $s0,0x18($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end display_flags_accumulate
