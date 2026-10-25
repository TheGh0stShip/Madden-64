.text
.align 2
.set noreorder
.globl display_list_copy_or_branch
.ent display_list_copy_or_branch
display_list_copy_or_branch:
    lui $v0,%hi(D_80074A37)
    lbu $v0,%lo(D_80074A37)($v0)
    beqz $v0,.Lbranch
     move $a2,$a0
    addiu $a1,$a1,-8
    sltu $v0,$a2,$a1
    beqz $v0,.Ldone
     nop
.Lcopy:
    lui $v1,%hi(D_80084F5C)
    lw $v1,%lo(D_80084F5C)($v1)
    lw $v0,0($a2)
    sw $v0,0($v1)
    lw $a0,4($a2)
    addiu $a2,$a2,8
    addiu $v0,$v1,8
    lui $at,%hi(D_80084F5C)
    sw $v0,%lo(D_80084F5C)($at)
    sltu $v0,$a2,$a1
    bnez $v0,.Lcopy
     sw $a0,4($v1)
    j .Ldone
     nop
.Lbranch:
    lui $v0,%hi(D_80084F5C)
    lw $v0,%lo(D_80084F5C)($v0)
    addiu $v1,$v0,8
    lui $at,%hi(D_80084F5C)
    sw $v1,%lo(D_80084F5C)($at)
    lui $v1,0x0600
    sw $v1,0($v0)
    sw $a2,4($v0)
.Ldone:
    jr $ra
     nop
.end display_list_copy_or_branch
