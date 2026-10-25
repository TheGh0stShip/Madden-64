.text
.align 2
.set noreorder
.globl menu_option_dispatch
.ent menu_option_dispatch
menu_option_dispatch:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    addiu $a0,$zero,7
    sw $ra,0x18($sp)
    jal func_8001FA38
     sw $s1,0x14($sp)
    addiu $a0,$zero,7
    addiu $a1,$zero,8
    jal func_8001FA50
     move $s1,$v0
    lui $v0,%hi(D_80086178)
    lw $v0,%lo(D_80086178)($v0)
    lw $a2,0x20($v0)
    addiu $a0,$zero,7
    move $a1,$s0
    jal func_8001FA68
     move $a3,$a2
    sll $v0,$v0,16
    sra $v0,$v0,16
    addiu $v1,$zero,1
    bne $v0,$v1,.Lrestore
     addiu $a0,$zero,7
    addiu $a0,$zero,0x2d
    jal func_8009CBB8
     addiu $a1,$zero,0xd2
    addiu $a0,$zero,7
.Lrestore:
    sll $a1,$s1,16
    jal func_8001FA50
     sra $a1,$a1,16
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end menu_option_dispatch
