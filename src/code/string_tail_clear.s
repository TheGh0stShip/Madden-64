.text
.align 2
.set noreorder
.globl string_tail_clear
.ent string_tail_clear
string_tail_clear:
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a0
    sw $s0,0x10($sp)
    move $s0,$a2
    sw $s1,0x14($sp)
    move $s1,$a1
    sw $ra,0x20($sp)
    jal func_8004DF94
     sw $s2,0x18($sp)
    addu $s2,$s3,$v0
    sll $s0,$s0,16
    andi $s1,$s1,0xff
.Lmeasure_arg:
    sra $a0,$s0,16
.Lmeasure:
    jal func_80016A24
     move $a1,$s3
    sll $v0,$v0,16
    sra $v0,$v0,16
    slt $v0,$s1,$v0
    beqz $v0,.Ldone
     addiu $s2,$s2,-1
    sltu $v0,$s3,$s2
    bnel $v0,$zero,.Lmeasure_arg
     sb $zero,0($s2)
    j .Lmeasure
     sra $a0,$s0,16
.Ldone:
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end string_tail_clear
