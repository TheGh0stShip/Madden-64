.text
.align 2
.set noreorder
.globl play_flags_finalize
.ent play_flags_finalize
play_flags_finalize:
    lui $v1,0x8009
    lbu $v1,-0x750e($v1)
    addiu $sp,$sp,-0x18
    addiu $v0,$zero,1
    bne $v1,$v0,.Lreturn
     sw $ra,0x10($sp)
    lui $a0,0x8009
    lbu $a0,-0x750d($a0)
    addiu $a1,$zero,0xf
    jal func_800259E4
     addiu $a2,$zero,1
    lui $a0,0x8009
    lbu $a0,-0x750d($a0)
    addiu $a1,$zero,0x12
    addiu $a2,$zero,1
    jal func_800259E4
     xori $a0,$a0,1
    lui $a1,0x8009
    lbu $a1,-0x750a($a1)
    andi $a0,$a1,0xff
    sltu $v1,$zero,$a0
    xori $v0,$a0,8
    sltu $v0,$zero,$v0
    and $v1,$v1,$v0
    beqz $v1,.Lclear
     addiu $v0,$a1,-5
    sltiu $v0,$v0,2
    bnez $v0,.Lclear
     addiu $v0,$zero,7
    bnel $a0,$v0,.Lnormal
     addiu $a1,$zero,0x10
    lui $a0,0x8009
    lbu $a0,-0x750d($a0)
    addiu $a1,$zero,0x11
    jal func_800259E4
     addiu $a2,$zero,1
    lui $a0,0x8009
    lbu $a0,-0x750d($a0)
    j .Lopposite
     addiu $a1,$zero,0x14
.Lnormal:
    lui $a0,0x8009
    lbu $a0,-0x750d($a0)
    jal func_800259E4
     addiu $a2,$zero,1
    lui $a0,0x8009
    lbu $a0,-0x750d($a0)
    addiu $a1,$zero,0x13
.Lopposite:
    addiu $a2,$zero,1
    jal func_800259E4
     xori $a0,$a0,1
.Lclear:
    lui $at,0x8009
    sb $zero,-0x750e($at)
.Lreturn:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end play_flags_finalize
