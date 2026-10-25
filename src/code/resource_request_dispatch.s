.text
.align 2
.set noreorder
.globl resource_request_dispatch
.ent resource_request_dispatch
resource_request_dispatch:
    addiu $sp,$sp,-0x28
    sw $s1,0x14($sp)
    move $s1,$a0
    sw $s0,0x10($sp)
    addiu $s0,$zero,3
    andi $a0,$a1,0xff
    sw $s2,0x18($sp)
    lui $s2,0x8008
    addiu $s2,$s2,-0x5ba4
    move $a1,$s2
    sw $s3,0x1c($sp)
    sw $ra,0x20($sp)
    jal func_8003515C
     move $s3,$a2
    andi $a0,$v0,0xffff
    beqz $a0,.Lreturn
     andi $v0,$s0,0xffff
    jal func_80031A1C
     nop
    andi $v0,$v0,0xffff
    sll $v0,$v0,1
    addu $v0,$v0,$s2
    lhu $a1,0($v0)
    srl $v0,$a1,8
    bnez $v0,.Lsecondary
     move $a0,$s1
    jal func_80034388
     move $a0,$s1
    j .Lvalue
     addiu $s0,$zero,2
.Lsecondary:
    jal func_80035064
     andi $a2,$s3,0xffff
    move $s0,$v0
.Lvalue:
    andi $v0,$s0,0xffff
.Lreturn:
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end resource_request_dispatch
