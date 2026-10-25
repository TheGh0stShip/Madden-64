.text
.align 2
.set noreorder
.globl layout_coordinates_build
.ent layout_coordinates_build
layout_coordinates_build:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $s1,0x14($sp)
    move $s1,$a1
    sw $s2,0x18($sp)
    move $s2,$a2
    andi $a3,$a3,0x10
    beqz $a3,.Lcompact
     sw $ra,0x1c($sp)
    jal func_8001C670
     nop
    addu $v0,$v0,$s1
    jal func_8001CA44
     sh $v0,0($s0)
    addu $v0,$v0,$s2
    jal func_8001C670
     sh $v0,2($s0)
    addu $v0,$v0,$s1
    jal func_8001CA44
     sh $v0,0x10($s0)
    addu $v0,$v0,$s2
    jal func_8001C670
     sh $v0,0x12($s0)
    addu $v0,$v0,$s1
    jal func_8001CA44
     sh $v0,0x30($s0)
    addu $v0,$v0,$s2
    jal func_8001C670
     sh $v0,0x32($s0)
    addu $v0,$v0,$s1
    jal func_8001CA44
     sh $v0,0x20($s0)
    j .Lfinal
     addu $v0,$v0,$s2
.Lcompact:
    jal func_8001C670
     nop
    addu $v0,$v0,$s1
    sh $v0,0x20($s0)
    jal func_8001CA44
     sh $v0,0($s0)
    addu $v0,$v0,$s2
    sh $v0,0x12($s0)
    jal func_8001C670
     sh $v0,2($s0)
    addu $v0,$v0,$s1
    sh $v0,0x30($s0)
    jal func_8001CA44
     sh $v0,0x10($s0)
    addu $v0,$v0,$s2
    sh $v0,0x32($s0)
.Lfinal:
    sh $v0,0x22($s0)
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end layout_coordinates_build
