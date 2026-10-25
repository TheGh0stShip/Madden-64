.text
.align 2
.set noreorder
.globl object_texture_state_refresh
.ent object_texture_state_refresh
object_texture_state_refresh:
    lui $v0,0x8008
    lbu $v0,0x7a94($v0)
    addiu $sp,$sp,-0x20
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lw $s0,8($a0)
    beqz $v0,.Ldisable
     nop
    jal func_80011248
     nop
    lhu $v1,0xa8($s0)
    andi $v1,$v1,0x10
    bnez $v1,.Lcopy
     move $s1,$v0
    lw $a0,4($s0)
    jal func_8000E7F4
     nop
    lhu $v0,0xa8($s0)
    ori $v0,$v0,0x10
    sh $v0,0xa8($s0)
.Lcopy:
    beqz $s1,.Ldone
     nop
    lhu $v0,0($s1)
    sh $v0,0x14($s0)
    lhu $v0,2($s1)
    j .Ldone
     sh $v0,0x16($s0)
.Ldisable:
    lhu $v0,0xa8($s0)
    andi $v0,$v0,0x10
    beqz $v0,.Ldone
     nop
    lw $a0,4($s0)
    jal func_8000E954
     nop
    lhu $v0,0xa8($s0)
    sh $zero,0x14($s0)
    andi $v0,$v0,0xffef
    sh $v0,0xa8($s0)
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end object_texture_state_refresh
