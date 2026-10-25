.text
.align 2
.set noreorder
.globl team_stat_ratio_pack
.ent team_stat_ratio_pack
team_stat_ratio_pack:
    addiu $sp,$sp,-0x20
    sw $s2,0x18($sp)
    move $s2,$a1
    sw $s1,0x14($sp)
    andi $s1,$a0,0xffff
    move $a0,$s1
    andi $a1,$a2,0xffff
    sw $ra,0x1c($sp)
    jal func_80023F94
     sw $s0,0x10($sp)
    sll $v0,$v0,16
    sra $s0,$v0,16
    beqz $s0,.Lzero
     move $a0,$s1
    jal func_80023F94
     andi $a1,$s2,0xffff
    sll $v0,$v0,16
    sra $v0,$v0,16
    sll $a0,$v0,2
    addu $a0,$a0,$v0
    sll $a0,$a0,1
    div $zero,$a0,$s0
    bnez $s0,.Ldiv_ok
     nop
    break 7
.Ldiv_ok:
    addiu $at,$zero,-1
    bne $s0,$at,.Loverflow_ok
     lui $at,0x8000
    bne $a0,$at,.Loverflow_ok
     nop
    break 6
.Loverflow_ok:
    mflo $a0
    lui $v0,0x6666
    ori $v0,$v0,0x6667
    mult $a0,$v0
    sra $v1,$a0,31
    mfhi $a3
    sra $v0,$a3,2
    subu $v0,$v0,$v1
    sll $v1,$v0,2
    addu $v1,$v1,$v0
    sll $v1,$v1,1
    subu $a0,$a0,$v1
    andi $a0,$a0,0xffff
    sll $v0,$v0,16
    j .Ldone
     or $v0,$v0,$a0
.Lzero:
    move $v0,$zero
.Ldone:
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end team_stat_ratio_pack
