.text
.align 2
.set noreorder
.globl menu_selection_confirm
.ent menu_selection_confirm
menu_selection_confirm:
    lui $v1,%hi(D_80089320)
    lh $v1,%lo(D_80089320)($v1)
    addiu $sp,$sp,-0x18
    addiu $v0,$zero,-1
    beq $v1,$v0,.Ldone
     sw $ra,0x10($sp)
    lui $v1,%hi(D_80088AE4)
    lh $v1,%lo(D_80088AE4)($v1)
    lui $a2,%hi(D_80084F34)
    lw $a2,%lo(D_80084F34)($a2)
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    subu $v0,$v0,$v1
    sll $v0,$v0,3
    lui $at,0x8008
    addu $at,$at,$v0
    lw $a1,0x5040($at)
    addiu $a0,$zero,10
    jal func_8001FA68
     move $a3,$a2
    sll $v0,$v0,16
    sra $v0,$v0,16
    addiu $v1,$zero,1
    bne $v0,$v1,.Ldone
     addiu $a0,$zero,0x2d
    jal func_8009CBB8
     addiu $a1,$zero,0xd2
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end menu_selection_confirm
