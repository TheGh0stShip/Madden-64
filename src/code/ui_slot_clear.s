.text
.align 2
.set noreorder
.globl ui_slot_clear
.ent ui_slot_clear
ui_slot_clear:
    addiu $sp,$sp,-0x20
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lw $s1,8($a0)
    lw $v0,0x20($s1)
    addu $a0,$v0,$a1
    lbu $v1,0($a0)
    andi $v0,$v1,0x80
    beqz $v0,.Ldone
     andi $v0,$v1,0x7f
    sb $v0,0($a0)
    lw $v0,0x2c($s1)
    lw $a0,0x18($s1)
    sll $s0,$a1,2
    addu $v0,$s0,$v0
    lw $a1,0($v0)
    jal func_8000D874
     nop
    lw $v0,0x2c($s1)
    lui $a0,%hi(D_8008931C)
    lw $a0,%lo(D_8008931C)($a0)
    addu $v0,$s0,$v0
    lw $a1,0($v0)
    jal func_8000D834
     nop
    lw $v0,0x2c($s1)
    addu $s0,$s0,$v0
    sw $zero,0($s0)
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end ui_slot_clear
