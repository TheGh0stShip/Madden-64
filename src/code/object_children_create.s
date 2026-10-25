.text
.align 2
.set noreorder
.globl object_children_create
.ent object_children_create
object_children_create:
    addiu $sp,$sp,-0x28
    sw $s2,0x18($sp)
    move $s2,$a0
    lui $a0,0x8008
    lw $a0,-0x7d10($a0)
    sw $s4,0x20($sp)
    move $s4,$a2
    sw $s3,0x1c($sp)
    move $s3,$a1
    sw $ra,0x24($sp)
    sw $s1,0x14($sp)
    jal func_80033298
     sw $s0,0x10($sp)
    lui $v1,0x8006
    lw $v1,0x4ba8($v1)
    move $s1,$s2
    move $s0,$v0
    sw $zero,0xc($s0)
    sw $zero,8($s0)
    beqz $v1,.Llink
     sw $zero,0($s0)
    sw $s0,0($v1)
.Llink:
    lui $v1,0x8006
    lw $v1,0x4ba8($v1)
    move $v0,$s1
    addiu $s1,$s2,-1
    andi $v0,$v0,0xffff
    lui $at,0x8006
    sw $s0,0x4ba8($at)
    beqz $v0,.Lreturn
     sw $v1,4($s0)
    ori $s2,$zero,0xffff
.Lloop:
    move $a0,$s0
    andi $a1,$s3,0xffff
    jal func_8000D740
     move $a2,$s4
    move $v0,$s1
    andi $v0,$v0,0xffff
    bnez $v0,.Lloop
     addu $s1,$s1,$s2
.Lreturn:
    move $v0,$s0
    lw $ra,0x24($sp)
    lw $s4,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end object_children_create
