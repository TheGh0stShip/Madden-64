.text
.align 2
.set noreorder
.globl display_scissor_cache
.ent display_scissor_cache
display_scissor_cache:
    lui $v0,%hi(D_800887A0)
    lw $v0,%lo(D_800887A0)($v0)
    move $a3,$a0
    bne $v0,$a3,.Lemit
     nop
    lui $v0,%hi(D_800887A4)
    lw $v0,%lo(D_800887A4)($v0)
    bne $v0,$a1,.Lemit
     nop
    lui $v0,%hi(D_800887A8)
    lw $v0,%lo(D_800887A8)($v0)
    beq $v0,$a2,.Ldone
     nop
.Lemit:
    lui $a0,%hi(D_80084F5C)
    lw $a0,%lo(D_80084F5C)($a0)
    andi $v1,$a2,0xfff
    sll $v1,$v1,16
    addiu $v0,$a0,8
    lui $at,%hi(D_80084F5C)
    sw $v0,%lo(D_80084F5C)($at)
    lui $v0,0xeb00
    sw $v0,0($a0)
    andi $v0,$a3,0xff
    sll $v0,$v0,8
    or $v1,$v1,$v0
    andi $v0,$a1,0xff
    or $v1,$v1,$v0
    sw $v1,4($a0)
    lui $at,%hi(D_800887A0)
    sw $a3,%lo(D_800887A0)($at)
    lui $at,%hi(D_800887A4)
    sw $a1,%lo(D_800887A4)($at)
    lui $at,%hi(D_800887A8)
    sw $a2,%lo(D_800887A8)($at)
.Ldone:
    jr $ra
     nop
.end display_scissor_cache
