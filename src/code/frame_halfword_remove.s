.text
.align 2
.set noreorder
.globl frame_halfword_remove
.ent frame_halfword_remove
frame_halfword_remove:
    addiu $sp,$sp,-0x18
    addu $a1,$zero,$zero
    andi $t0,$a0,0xffff
    addiu $a2,$zero,0x7f
    sw $s0,0x10($sp)
    ori $s0,$zero,0xffff
    sw $ra,0x14($sp)
.Lloop:
    lui $a3,%hi(D_80073438)
    lw $a3,%lo(D_80073438)($a3)
    andi $v1,$a1,0xffff
    sll $a0,$v1,1
    addu $v0,$a0,$a3
    lhu $v0,0xce4($v0)
    bne $v0,$t0,.Ladvance
     addiu $a1,$a1,1
    addiu $a0,$a0,0xce4
    sll $a1,$v1,1
    addiu $a1,$a1,0xce6
    subu $a2,$a2,$v1
    addu $a0,$a3,$a0
    addu $a1,$a3,$a1
    jal func_8002E17C
     sll $a2,$a2,1
    lui $v0,%hi(D_80073438)
    lw $v0,%lo(D_80073438)($v0)
    j .Lreturn
     sh $s0,0xde2($v0)
.Ladvance:
    andi $v0,$a1,0xffff
    sltiu $v0,$v0,0x80
    bnez $v0,.Lloop
     nop
.Lreturn:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end frame_halfword_remove
