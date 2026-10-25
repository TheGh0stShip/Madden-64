.text
.align 2
.set noreorder
.globl color_tables_refresh
.ent color_tables_refresh
color_tables_refresh:
    lui $a0,0x8009
    lw $a0,-0x5c20($a0)
    addiu $sp,$sp,-0x18
    sw $ra,0x10($sp)
    jal func_8000DE34
     nop
    jal func_8000DF10
     nop
    move $a1,$v0
    move $a0,$zero
    andi $v1,$a0,0xffff
.Lfirst:
    addu $v0,$a1,$v1
    lbu $v0,0($v0)
    addiu $a0,$a0,1
    addiu $v0,$v0,-0x10
    lui $at,0x8007
    addu $at,$at,$v1
    sb $v0,0x4a38($at)
    andi $v0,$a0,0xffff
    sltiu $v0,$v0,3
    bnez $v0,.Lfirst
     andi $v1,$a0,0xffff
    jal func_8000E02C
     move $a0,$zero
    move $a1,$v0
    move $a0,$zero
    andi $v1,$a0,0xffff
.Lsecond:
    addu $v0,$a1,$v1
    lbu $v0,0($v0)
    addiu $a0,$a0,1
    addiu $v0,$v0,0x20
    lui $at,0x8007
    addu $at,$at,$v1
    sb $v0,0x4a3c($at)
    andi $v0,$a0,0xffff
    sltiu $v0,$v0,3
    bnez $v0,.Lsecond
     andi $v1,$a0,0xffff
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end color_tables_refresh
