.text
.align 2
.set noreorder
.globl record_key_replace
.ent record_key_replace
record_key_replace:
    addiu $sp,$sp,-0x28
    sw $ra,0x20($sp)
    sw $s3,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lw $s0,8($a0)
    lw $s1,0xc($a0)
    addu $s2,$a1,$zero
    sltu $v0,$s0,$s1
    beqz $v0,.Lreturn
     addu $s3,$a2,$zero
    addu $a0,$s0,$zero
.Lloop:
    addu $a1,$s2,$zero
    jal func_8002E148
     addiu $a2,$zero,8
    bnel $v0,$zero,.Ltest
     addiu $s0,$s0,8
    lw $v0,0($s3)
    lw $v1,4($s3)
    sw $v0,0($s0)
    sw $v1,4($s0)
.Ladvance:
    addiu $s0,$s0,8
.Ltest:
    sltu $v0,$s0,$s1
    bnez $v0,.Lloop
     addu $a0,$s0,$zero
.Lreturn:
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end record_key_replace
