.text
.align 2
.set noreorder
.globl audio_range_randomize
.ent audio_range_randomize
audio_range_randomize:
    addiu $sp,$sp,-0x20
    sw $s1,0x14($sp)
    move $s1,$a0
    move $a0,$zero
    sw $ra,0x18($sp)
    sw $s0,0x10($sp)
    lbu $a1,2($s1)
.Lscan:
    sll $v0,$a0,16
.Lscan_body:
    sra $v1,$v0,14
    lui $at,0x8007
    addu $at,$at,$v1
    lbu $v0,0x40a4($at)
    sltu $v0,$a1,$v0
    bnez $v0,.Lincrement
     addiu $v0,$a0,1
    lui $at,0x8007
    addu $at,$at,$v1
    lbu $v0,0x40a5($at)
    sltu $v0,$v0,$a1
    beqz $v0,.Lfound
     addiu $v0,$a0,1
.Lincrement:
    move $a0,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,6
    bnez $v0,.Lscan_body
     sll $v0,$a0,16
.Lfound:
    sll $v0,$a0,16
    sra $s0,$v0,14
    lui $at,0x8007
    addu $at,$at,$s0
    lbu $v0,0x40a6($at)
    lui $at,0x8007
    addu $at,$at,$s0
    lbu $a0,0x40a7($at)
    bne $v0,$a0,.Lrandom
     subu $a0,$a0,$v0
    j .Ldone
     sb $v0,3($s1)
.Lrandom:
    jal func_80031A1C
     andi $a0,$a0,0xffff
    lui $at,0x8007
    addu $at,$at,$s0
    lbu $v1,0x40a6($at)
    addu $v1,$v1,$v0
    sb $v1,3($s1)
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_range_randomize
