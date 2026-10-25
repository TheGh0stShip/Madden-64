.text
.align 2
.set noreorder
.globl audio_value_seek
.ent audio_value_seek
audio_value_seek:
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a2
    sw $s0,0x10($sp)
    addu $s0,$a1,$a2
    sw $s2,0x18($sp)
    sll $s2,$a0,16
    sll $a2,$a2,16
    sw $s1,0x14($sp)
    sra $s1,$a2,16
    sw $ra,0x20($sp)
.Lbranch:
    sll $a1,$s0,16
.Ltest:
    sra $a0,$s2,16
    jal func_8003C154
     sra $a1,$a1,16
    sll $v0,$v0,16
    bnez $v0,.Ldone
     addu $v0,$s0,$s3
    blez $s1,.Lnegative
     move $s0,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,0x64
    beqzl $v0,.Lbranch
     addiu $s0,$zero,1
    j .Ltest
     sll $a1,$s0,16
.Lnegative:
    sll $v0,$v0,16
    blezl $v0,.Lbranch
     addiu $s0,$zero,0x63
    j .Ltest
     sll $a1,$s0,16
.Ldone:
    sll $v0,$s0,16
    sra $v0,$v0,16
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end audio_value_seek
