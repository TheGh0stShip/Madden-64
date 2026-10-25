.text
.align 2
.set noreorder
.globl indexed_texel_increment
.ent indexed_texel_increment
indexed_texel_increment:
    addiu $sp,$sp,-8
    lw $v0,0x1c8($a0)
    lw $t4,0x70($a0)
    lw $t3,0x18($v0)
    blez $a3,.Ldone
     move $t2,$zero
.Lplane:
    lw $t1,0($a1)
    move $t0,$t4
    beql $t0,$zero,.Lnext_advance
     addiu $t2,$t2,1
    addiu $a2,$t1,2
.Ltexel:
    lbu $v0,0($t1)
    lbu $v1,-1($a2)
    srl $v0,$v0,3
    sll $v0,$v0,2
    addu $v0,$v0,$t3
    srl $v1,$v1,2
    lw $a0,0($v0)
    lbu $v0,0($a2)
    sll $v1,$v1,6
    addu $a0,$a0,$v1
    srl $v0,$v0,3
    sll $v0,$v0,1
    addu $a0,$a0,$v0
    lhu $v1,0($a0)
    addiu $v0,$v1,1
    sh $v0,0($a0)
    andi $v0,$v0,0xffff
    beql $v0,$zero,.Ladvance
     sh $v1,0($a0)
.Ladvance:
    addiu $a2,$a2,3
    addiu $t0,$t0,-1
    bnez $t0,.Ltexel
     addiu $t1,$t1,3
.Lnext:
    addiu $t2,$t2,1
.Lnext_advance:
    slt $v0,$t2,$a3
    bnez $v0,.Lplane
     addiu $a1,$a1,4
.Ldone:
    addiu $sp,$sp,8
    jr $ra
     nop
.end indexed_texel_increment
