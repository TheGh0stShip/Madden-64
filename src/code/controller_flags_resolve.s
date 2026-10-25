.text
.align 2
.set noreorder
.globl controller_flags_resolve
.ent controller_flags_resolve
controller_flags_resolve:
    addiu $sp,$sp,-0x28
    sw $s1,0x1c($sp)
    move $s1,$a1
    sw $s2,0x20($sp)
    move $s2,$a0
    sw $ra,0x24($sp)
    beqz $s1,.Llookup
     sw $s0,0x18($sp)
    sll $v0,$a0,16
    sra $a0,$v0,16
    lui $at,0x8008
    addu $at,$at,$a0
    lb $v1,0x6de4($at)
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    lui $at,0x8009
    addu $at,$at,$a0
    lbu $v1,-0x7f18($at)
    sll $v0,$v0,1
    lui $at,0x8009
    addu $at,$at,$v0
    lhu $s0,-0x4c50($at)
    beqz $v1,.Lstore
     addiu $a1,$sp,0x10
    jal func_80030EF4
     addiu $a2,$sp,0x11
    lbu $v1,0x10($sp)
    sltiu $v0,$v1,0xa
    bnel $v0,$zero,.Lfirst_high
     ori $s0,$s0,0x200
.Lfirst_high:
    sltiu $v0,$v1,0x16
    beql $v0,$zero,.Lsecond
     ori $s0,$s0,0x100
.Lsecond:
    lbu $v1,0x11($sp)
    sltiu $v0,$v1,0xa
    bnel $v0,$zero,.Lsecond_high
     ori $s0,$s0,0x800
.Lsecond_high:
    sltiu $v0,$v1,0x16
    beql $v0,$zero,.Lstore
     ori $s0,$s0,0x400
.Lstore:
    andi $v0,$s0,0xff3f
    sw $v0,0($s1)
.Llookup:
    sll $v0,$s2,16
    sra $v0,$v0,14
    lui $at,0x8008
    addu $at,$at,$v0
    lw $v0,0x7100($at)
.Lreturn:
    lw $ra,0x24($sp)
    lw $s2,0x20($sp)
    lw $s1,0x1c($sp)
    lw $s0,0x18($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end controller_flags_resolve
