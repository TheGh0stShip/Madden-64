.text
.align 2
.set noreorder
.globl object_resources_release_full
.ent object_resources_release_full
object_resources_release_full:
    addiu $sp,$sp,-0x18
    sw $ra,0x14($sp)
    sw $s0,0x10($sp)
    lw $s0,8($a0)
    lw $a1,0xc($s0)
    jal func_80032F3C
     move $a0,$zero
    lw $a1,0x10($s0)
    jal func_80032F3C
     move $a0,$zero
    lbu $v0,8($s0)
    andi $v0,$v0,0x7f
    bnez $v0,.Ltype
     nop
    lui $a1,%hi(D_80065460)
    lw $a1,%lo(D_80065460)($a1)
    beqz $a1,.Ldone
     nop
    jal func_80032F3C
     move $a0,$zero
    lui $at,%hi(D_80065460)
    sw $zero,%lo(D_80065460)($at)
    j .Ldone
     nop
.Ltype:
    bltz $v0,.Ldone
     slti $v0,$v0,3
    beqz $v0,.Ldone
     nop
    lui $a1,%hi(D_8006545C)
    lw $a1,%lo(D_8006545C)($a1)
    beqz $a1,.Ldone
     nop
    jal func_80032F3C
     move $a0,$zero
    lui $at,%hi(D_8006545C)
    sw $zero,%lo(D_8006545C)($at)
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end object_resources_release_full
