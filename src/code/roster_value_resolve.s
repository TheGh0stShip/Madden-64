.text
.align 2
.set noreorder
.globl roster_value_resolve
.ent roster_value_resolve
roster_value_resolve:
    addiu $sp,$sp,-0x18
    move $v1,$a0
    bnez $v1,.Llookup
     sw $ra,0x10($sp)
    j .Lreturn
     move $v0,$zero
.Llookup:
    lbu $a0,0x1e($v1)
    lbu $v1,0x1f($v1)
    lui $a1,%hi(D_80081860)
    addiu $a1,$a1,%lo(D_80081860)
    sll $v0,$a0,5
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    subu $v0,$v0,$a0
    sll $v0,$v0,2
    sll $v1,$v1,1
    addu $v0,$v0,$a1
    addu $v1,$v1,$v0
    lhu $a1,0($v1)
    jal func_800397C8
     nop
    andi $v0,$v0,0xffff
.Lreturn:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end roster_value_resolve
