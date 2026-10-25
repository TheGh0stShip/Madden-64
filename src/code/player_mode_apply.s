.text
.align 2
.set noreorder
.globl player_mode_apply
.ent player_mode_apply
player_mode_apply:
    addiu $sp,$sp,-0x18
    move $v1,$a0
    sw $ra,0x14($sp)
    sw $s0,0x10($sp)
    lui $at,0x8007
    addu $at,$at,$a1
    lb $v0,-0x5648($at)
    sll $a0,$a0,24
    sra $a0,$a0,24
    beq $a0,$v0,.Ldone
     addiu $v0,$zero,1
    lui $at,0x8007
    addu $at,$at,$a1
    sb $v1,-0x5648($at)
    bne $a0,$v0,.Lalternate
     nop
    jal func_80021EE0
     andi $a0,$a1,0xffff
    j .Ldone
     nop
.Lalternate:
    lui $s0,%hi(D_80074808)
    lbu $s0,%lo(D_80074808)($s0)
    lui $at,%hi(D_80074808)
    sb $zero,%lo(D_80074808)($at)
    jal func_80021EE0
     andi $a0,$a1,0xffff
    lui $at,%hi(D_80074808)
    sb $s0,%lo(D_80074808)($at)
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end player_mode_apply
