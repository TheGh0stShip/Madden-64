.text
.align 2
.set noreorder
.globl frame_index_resolve
.ent frame_index_resolve
frame_index_resolve:
    addiu $sp,$sp,-0x18
    sw $ra,0x10($sp)
    andi $v0,$a0,0x8000
    bnez $v0,.Lresolve
     addu $v1,$a0,$zero
    addiu $v1,$a0,1
    andi $v0,$v1,0xffff
    sltiu $v0,$v0,0x17cd
    bnez $v0,.Lreturn
     nop
    jal func_80028224
     nop
    andi $v0,$v0,0xffff
    addiu $v1,$zero,1
    bne $v0,$v1,.Linvalid
     ori $v1,$zero,0xffff
    jal func_8003A50C
     nop
    andi $v0,$v0,0xffff
    beqz $v0,.Linvalid
     ori $v1,$zero,0xffff
    jal func_8003A584
     addu $a0,$zero,$zero
    j .Lreturn
     addu $v1,$v0,$zero
.Lresolve:
    jal func_8003A584
     andi $a0,$v1,0xffff
    addu $v1,$v0,$zero
    andi $v0,$v1,0xffff
    beql $v0,$zero,.Lreturn
     ori $v1,$zero,0xffff
.Linvalid:
.Lreturn:
    lw $ra,0x10($sp)
    andi $v0,$v1,0xffff
    jr $ra
     addiu $sp,$sp,0x18
.end frame_index_resolve
