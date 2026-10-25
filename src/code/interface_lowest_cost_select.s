.text
.align 2
.set noreorder
.globl interface_lowest_cost_select
.ent interface_lowest_cost_select
interface_lowest_cost_select:
    addiu $sp,$sp,-0x28
    sw $s2,0x18($sp)
    move $s2,$zero
    sw $ra,0x20($sp)
    sw $s3,0x1c($sp)
    sw $s1,0x14($sp)
    jal func_80024694
     sw $s0,0x10($sp)
    jal func_80024D28
     ori $a0,$zero,0xffff
    andi $s1,$v0,0xffff
    ori $v0,$zero,0xffff
    beq $s1,$v0,.Lfinish
     move $s0,$s1
    ori $s3,$zero,0xffff
.Lloop:
    jal func_8002A6AC
     move $a0,$s0
    move $v1,$v0
    sltu $v0,$v1,$s2
    bnez $v0,.Lnext
     nop
    move $s1,$s0
    move $s2,$v1
.Lnext:
    jal func_80024D28
     move $a0,$s0
    andi $s0,$v0,0xffff
    bne $s0,$s3,.Lloop
     nop
.Lfinish:
    jal func_80024E9C
     nop
    move $v0,$s1
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end interface_lowest_cost_select
