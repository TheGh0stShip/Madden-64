.text
.align 2
.set noreorder
.globl node_callbacks_apply
.ent node_callbacks_apply
node_callbacks_apply:
    addiu $sp,$sp,-0x20
    sw $s1,0x14($sp)
    addu $s1,$a1,$zero
    sw $ra,0x18($sp)
    sw $s0,0x10($sp)
    lw $a1,8($a0)
    beqz $a1,.Lreturn
     nop
.Lloop:
    lw $v0,0x14($a1)
    lw $s0,4($a1)
    andi $v0,$v0,1
    beql $v0,$zero,.Ladvance
     addu $a1,$s0,$zero
    lhu $a0,0x54($a1)
    lui $v1,%hi(D_800782FC)
    lw $v1,%lo(D_800782FC)($v1)
    sll $v0,$a0,1
    addu $v0,$v0,$a0
    sll $v0,$v0,3
    addu $v1,$v1,$v0
    lw $v0,0x1c($v1)
    addu $a0,$a1,$zero
    jalr $v0
     addu $a1,$s1,$zero
    addu $a1,$s0,$zero
.Ladvance:
    bnez $a1,.Lloop
     nop
.Lreturn:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end node_callbacks_apply
