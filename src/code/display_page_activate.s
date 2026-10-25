.text
.align 2
.set noreorder
.globl display_page_activate
.ent display_page_activate
display_page_activate:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x18($sp)
    jal func_80046918
     sw $s1,0x14($sp)
    addiu $a0,$zero,1
    jal func_8004D168
     move $s1,$v0
    xori $v0,$s0,1
    andi $v0,$v0,0xffff
    lui $a1,0x8008
    addiu $a1,$a1,0x7908
    sll $v0,$v0,2
    addu $a0,$v0,$a1
    lui $v1,0x8008
    addiu $v1,$v1,0x6170
    addu $v0,$v0,$v1
    lw $v0,0($v0)
    lw $v1,0($a0)
    andi $v0,$v0,1
    or $v1,$v1,$v0
    beqz $v1,.Lclear
     andi $v0,$s0,0xffff
    sll $v0,$v0,2
    addu $v0,$v0,$a1
    addiu $v1,$zero,1
    sw $v1,0($v0)
    jal func_8004D168
     move $a0,$s1
    j .Ldone
     nop
.Lclear:
    jal func_8004D168
     move $a0,$s1
    jal func_8000BB98
     andi $a0,$s0,0xffff
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end display_page_activate
