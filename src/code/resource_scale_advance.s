.text
.align 2
.set noreorder
.globl resource_scale_advance
.ent resource_scale_advance
resource_scale_advance:
    lw $a2,8($a0)
    lw $v0,4($a2)
    lh $t0,0xc($a2)
    lbu $v0,0($v0)
    lhu $a3,0x10($a2)
    addu $v0,$v0,$a1
    sh $v0,0xc($a2)
    lh $v0,0xc($a2)
    sll $a3,$a3,4
    andi $v1,$a3,0xfff0
    mult $v1,$v0
    mflo $v1
    nop
    nop
    divu $zero,$v1,$t0
    bnez $t0,.Ldiv1
     nop
    break 7
.Ldiv1:
    mflo $v1
    lhu $a0,0xa($a2)
    lh $a1,0xc($a2)
    sll $v0,$a0,20
    sra $v0,$v0,16
    mult $v0,$a1
    mflo $v0
    nop
    nop
    divu $zero,$v0,$t0
    bnez $t0,.Ldiv2
     nop
    break 7
.Ldiv2:
    mflo $v0
    sh $a3,0x10($a2)
    sll $a0,$a0,4
    sh $a0,0xa($a2)
    andi $v1,$v1,0xffff
    addiu $v1,$v1,8
    sra $v1,$v1,4
    sh $v1,0x10($a2)
    sll $v0,$v0,16
    sra $v0,$v0,16
    addiu $v0,$v0,8
    sra $v0,$v0,4
    jr $ra
     sh $v0,0xa($a2)
.end resource_scale_advance
