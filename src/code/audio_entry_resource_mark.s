.text
.align 2
.set noreorder
.globl audio_entry_resource_mark
.ent audio_entry_resource_mark
audio_entry_resource_mark:
    addiu $sp,$sp,-0x20
    sw $s1,0x14($sp)
    move $s1,$a1
    sw $s0,0x10($sp)
    move $s0,$a0
    andi $a0,$a0,0x8000
    bnez $a0,.Lalternate
     sw $ra,0x18($sp)
    andi $s0,$s0,0xffff
    jal func_80035D7C
     move $a0,$s0
    sll $a0,$s0,1
    addu $a0,$a0,$s0
    sll $a0,$a0,3
    lui $at,0x8009
    addu $at,$at,$a0
    lw $v1,-0x4f80($at)
    addu $v1,$v1,$s1
    lbu $v0,0($v1)
    ori $v0,$v0,0x80
    sb $v0,0($v1)
    lui $at,0x8009
    addu $at,$at,$a0
    lw $v1,-0x4f84($at)
    sll $v0,$s1,2
    addu $v0,$v0,$v1
    lw $v0,0($v0)
    j .Ldone
     nop
.Lalternate:
    andi $a0,$s0,0xffff
    jal func_80035D7C
     move $a1,$s1
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_entry_resource_mark
