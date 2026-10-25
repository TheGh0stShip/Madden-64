.text
.align 2
.set noreorder
.globl animation_step_update
.ent animation_step_update
animation_step_update:
    addiu $sp,$sp,-0x18
    move $a1,$a0
    sw $ra,0x10($sp)
    lhu $v0,0x12($a1)
    lbu $v1,0($a1)
    lhu $a0,0x10($a1)
    addiu $v0,$v0,1
    andi $v1,$v1,0xf9
    sh $v0,0x12($a1)
    andi $v0,$v0,0xffff
    sltu $v0,$v0,$a0
    beqz $v0,.Lcycle
     sb $v1,0($a1)
    lw $v0,0xc($a1)
    lw $v1,8($v0)
    lw $a0,4($v0)
    addu $v1,$v1,$a0
    j .Lupdate
     sw $v1,8($v0)
.Lcycle:
    lbu $v0,0($a1)
    andi $v0,$v0,1
    bnez $v0,.Lwrap
     addiu $v0,$zero,1
    sh $v0,0x12($a1)
    j .Lreturn_negative
     addiu $v0,$zero,-1
.Lwrap:
    lw $v0,0xc($a1)
    lw $v1,0x14($v0)
    sw $v1,8($v0)
    addiu $v0,$zero,1
    sh $v0,0x12($a1)
.Lupdate:
    jal func_8001A224
     move $a0,$a1
    move $v0,$zero
.Lreturn_negative:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end animation_step_update
