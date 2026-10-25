.text
.align 2
.set noreorder
.globl audio_bank_records_load
.ent audio_bank_records_load
audio_bank_records_load:
    lui $v1,0x8008
    lw $v1,0x5028($v1)
    addiu $sp,$sp,-0x20
    lui $at,0x8008
    sh $a0,0x7aae($at)
    sll $a0,$a0,16
    sra $a0,$a0,14
    sw $ra,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lui $at,0x8007
    addu $at,$at,$a0
    lw $s0,0x4680($at)
    addiu $v0,$zero,1
    bne $v1,$v0,.Ldone
     addiu $v0,$zero,-1
    lw $v1,0($s0)
    beq $v1,$v0,.Ldone
     addiu $s2,$zero,-1
    move $s1,$s0
.Lloop:
    lui $a0,0x8008
    lhu $a0,0x5d42($a0)
    lw $a1,4($s1)
    lw $s0,0($s1)
    jal func_80035D7C
     sll $s0,$s0,4
    move $a1,$v0
    lbu $a0,1($a1)
    lbu $v1,0($a1)
    addiu $v0,$a1,4
    lui $at,0x8008
    addu $at,$at,$s0
    sw $v0,0x7b70($at)
    sll $a0,$a0,8
    or $a0,$a0,$v1
    beqz $a0,.Lmetadata
     addiu $v0,$a0,4
    addu $v0,$a1,$v0
    lui $at,0x8008
    addu $at,$at,$s0
    sw $v0,0x7b74($at)
.Lmetadata:
    lhu $v0,8($s1)
    lui $at,0x8008
    addu $at,$at,$s0
    sw $v0,0x7b78($at)
    lhu $v0,0xa($s1)
    addiu $s1,$s1,0xc
    lui $at,0x8008
    addu $at,$at,$s0
    sw $v0,0x7b7c($at)
    lw $v0,0($s1)
    bne $v0,$s2,.Lloop
     nop
.Ldone:
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_bank_records_load
