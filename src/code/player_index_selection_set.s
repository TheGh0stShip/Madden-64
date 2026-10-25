.text
.align 2
.set noreorder
.globl player_index_selection_set
.ent player_index_selection_set
player_index_selection_set:
    addiu $sp,$sp,-0x18
    move $a2,$a1
    andi $a1,$a0,0xff
    sll $v0,$a1,5
    subu $v0,$v0,$a1
    sll $v0,$v0,3
    addu $v0,$v0,$a1
    sll $v1,$v0,3
    sw $ra,0x10($sp)
    lui $at,0x8008
    addu $at,$at,$v1
    lbu $v0,-0x7a5b($at)
    andi $a3,$a2,0xffff
    beq $v0,$a3,.Ldone
     nop
    lui $at,0x8008
    addu $at,$at,$v1
    sb $a2,-0x7a5b($at)
    lui $v1,%hi(D_80086DD8)
    lw $v1,%lo(D_80086DD8)($v1)
    lui $v0,%hi(D_800908B8)
    addiu $v0,$v0,%lo(D_800908B8)
    bne $v1,$v0,.Lnormal
     move $a2,$a1
    lui $a0,%hi(D_80087954)
    lhu $a0,%lo(D_80087954)($a0)
    j .Lcall
     sltiu $a2,$a1,1
.Lnormal:
    lui $a0,%hi(D_80087954)
    lhu $a0,%lo(D_80087954)($a0)
.Lcall:
    jal func_80044B90
     nop
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end player_index_selection_set
