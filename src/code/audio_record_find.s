.text
.align 2
.set noreorder
.globl audio_record_find
.ent audio_record_find
audio_record_find:
    lui $v0,0x8007
    lw $v0,0x40c4($v0)
    addiu $sp,$sp,-0x20
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lhu $v0,0($v0)
    move $s1,$a0
    beqz $v0,.Lafter_scan
     move $s0,$zero
    addiu $a0,$zero,0x80
.Lloop:
    lui $a2,0x8007
    lw $a2,0x40c4($a2)
    andi $v0,$s0,0xffff
    sll $a1,$v0,2
    addu $v0,$a2,$a1
    lhu $v1,2($v0)
    lhu $v0,0($s1)
    bnel $v1,$v0,.Lnext
     addiu $s0,$s0,1
    lbu $v0,3($s1)
    bnel $v0,$a0,.Lcompare
     move $a0,$s1
    sll $a0,$s0,16
    jal func_80040214
     sra $a0,$a0,16
    j .Lafter_scan
     nop
.Lcompare:
    addiu $a1,$a1,2
    jal func_8003FF14
     addu $a1,$a2,$a1
    j .Lafter_scan
     nop
.Lnext:
    lhu $v1,0($a2)
    andi $v0,$s0,0xffff
    sltu $v0,$v0,$v1
    bnez $v0,.Lloop
     nop
.Lafter_scan:
    lui $v0,0x8007
    lw $v0,0x40c4($v0)
    lhu $v1,0($v0)
    andi $v0,$s0,0xffff
    bne $v0,$v1,.Ldone
     addiu $v0,$zero,0x80
    lbu $v1,3($s1)
    beq $v1,$v0,.Ldone
     nop
    jal func_800401D0
     move $a0,$s1
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_record_find
