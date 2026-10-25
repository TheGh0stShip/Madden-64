.text
.align 2
.set noreorder
.globl audio_name_find
.ent audio_name_find
audio_name_find:
    addiu $sp,$sp,-0x20
    sw $s2,0x18($sp)
    move $s2,$a0
    sw $s0,0x10($sp)
    move $s0,$a1
    sw $s1,0x14($sp)
    move $s1,$zero
    lui $a0,0x8000
    addiu $a0,$a0,0x2d10
    sw $ra,0x1c($sp)
    jal func_80037108
     move $a1,$zero
    move $t0,$zero
    addiu $t3,$zero,0xff
    addiu $t2,$zero,1
    move $a2,$v0
.Lrecord:
    lbu $v0,0xd($a2)
    beq $v0,$t3,.Lnext
     addiu $t1,$zero,1
    move $a0,$s2
    move $a1,$a2
    addiu $a3,$a0,0xc
.Lcompare:
    lbu $v1,0($a1)
    lbu $v0,0($a0)
    bnel $v1,$v0,.Lcompared
     move $t1,$zero
    beqz $v1,.Lcompared
     nop
    addiu $a0,$a0,1
    sltu $v0,$a0,$a3
    bnez $v0,.Lcompare
     addiu $a1,$a1,1
.Lcompared:
    bnel $t1,$t2,.Lnext_advance
     addiu $t0,$t0,1
    beqz $s0,.Ldone
     addiu $s1,$zero,1
    j .Ldone
     sb $t0,0($s0)
.Lnext:
    addiu $t0,$t0,1
.Lnext_advance:
    sltiu $v0,$t0,0x18
    bnez $v0,.Lrecord
     addiu $a2,$a2,0x28
.Ldone:
    move $v0,$s1
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end audio_name_find
