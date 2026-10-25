.text
.align 2
.set noreorder
.globl display_command_link
.ent display_command_link
display_command_link:
    addiu $sp,$sp,-0x18
    move $a3,$a0
    sw $ra,0x10($sp)
    lbu $v0,0x50($a3)
    bnez $v0,.Lalternate
     andi $v0,$a2,0xff
    lui $at,0x8007
    addu $at,$at,$v0
    lbu $t0,0x4924($at)
    j .Lselected
     nop
.Lalternate:
    lui $at,0x8007
    addu $at,$at,$v0
    lbu $t0,0x4934($at)
.Lselected:
    lui $a0,0x8008
    lw $a0,-0x5660($a0)
    sw $a1,4($a0)
    lw $v1,0x24($a3)
    andi $v0,$a2,0xff
    sll $v0,$v0,2
    addu $v0,$v0,$v1
    lw $v0,0($v0)
    sw $v0,0($a0)
    lw $v1,0x28($a3)
    addiu $v0,$a0,0x10
    lui $at,0x8008
    sw $v0,-0x5660($at)
    sw $v1,8($a0)
    lbu $v1,0x51($a3)
    lui $a1,0x8008
    addiu $a1,$a1,-0x5640
    sll $v0,$v1,2
    addu $v0,$v0,$v1
    sll $v0,$v0,4
    sll $v1,$t0,2
    addu $v0,$v0,$a1
    addu $v1,$v1,$v0
    lw $a1,0($v1)
    sw $a0,0($v1)
    lw $v0,0($a0)
    sw $a1,0xc($a0)
    lw $a1,0x14($v0)
    beqz $a1,.Ldone
     nop
    jal func_80045704
     move $a0,$zero
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end display_command_link
