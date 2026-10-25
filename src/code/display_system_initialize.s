.text
.align 2
.set noreorder
.globl display_system_initialize
.ent display_system_initialize
display_system_initialize:
    addiu $sp,$sp,-0x20
    sw $s1,0x14($sp)
    move $s1,$zero
    sw $s2,0x18($sp)
    lui $s2,%hi(D_800748FC)
    addiu $s2,$s2,%lo(D_800748FC)
    sw $ra,0x1c($sp)
    sw $s0,0x10($sp)
.Lloop:
    lui $a0,%hi(D_8007A9A4)
    lhu $a0,%lo(D_8007A9A4)($a0)
    andi $s0,$s1,0xffff
    sll $v0,$s0,1
    addu $v0,$v0,$s2
    lhu $a1,0($v0)
    move $a2,$s0
    jal func_8004486C
     addiu $a3,$zero,3
    lui $a0,%hi(D_8007A9A4)
    lhu $a0,%lo(D_8007A9A4)($a0)
    addiu $s1,$s1,1
    jal func_80044744
     move $a1,$s0
    jal func_800444D0
     move $a0,$s0
    andi $v0,$s1,0xffff
    sltiu $v0,$v0,2
    bnez $v0,.Lloop
     nop
    jal func_8004211C
     nop
    lui $at,%hi(D_8007A9A4)
    sh $zero,%lo(D_8007A9A4)($at)
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end display_system_initialize
