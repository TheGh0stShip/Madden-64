.text
.align 2
.set noreorder
.globl display_texture_pair_update
.ent display_texture_pair_update
display_texture_pair_update:
    addiu $v1,$a0,-1
    lui $v0,%hi(D_80088A7C)
    addiu $v0,$v0,%lo(D_80088A7C)
    sll $a0,$a0,2
    addu $t0,$a0,$v0
    lw $v0,0($t0)
    sll $a2,$v1,5
    beq $v0,$a1,.Ldone
     addiu $a3,$a2,4
    lui $v1,%hi(D_80084F5C)
    lw $v1,%lo(D_80084F5C)($v1)
    lui $a0,0xbc00
    ori $a0,$a0,0xa
    addiu $v0,$v1,8
    lui $at,%hi(D_80084F5C)
    sw $v0,%lo(D_80084F5C)($at)
    andi $v0,$a2,0xffff
    sll $v0,$v0,8
    or $v0,$v0,$a0
    sw $v0,0($v1)
    addiu $v0,$v1,0x10
    lui $at,%hi(D_80084F5C)
    sw $v0,%lo(D_80084F5C)($at)
    andi $v0,$a3,0xffff
    sll $v0,$v0,8
    or $v0,$v0,$a0
    sw $a1,4($v1)
    sw $v0,8($v1)
    sw $a1,0xc($v1)
    sw $a1,0($t0)
.Ldone:
    jr $ra
     nop
.end display_texture_pair_update
