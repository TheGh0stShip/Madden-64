.text
.align 2
.globl audio_frame_record_copy
.ent audio_frame_record_copy
audio_frame_record_copy:
    .frame $sp,24,$ra
    .mask 0x80000000,-8
    .fmask 0x00000000,0
    subu $sp,$sp,24
    move $t1,$a1
    move $t2,$a0
    andi $a1,$t2,0xffff
    li $v0,0xffff
    .set noreorder
    .set nomacro
    beq $a1,$v0,2f
     sw $ra,16($sp)
    .set macro
    .set reorder

    andi $v0,$a0,0x8000
    .set noreorder
    .set nomacro
    beq $v0,$zero,3f
     andi $v0,$a1,0x7fff
    .set macro
    .set reorder

    sll $v1,$v0,2
    lw $a0,D_8007343C
    addu $v1,$v1,$v0
    sll $v1,$v1,3
    .set noreorder
    .set nomacro
    j 4f
     addu $v0,$a0,$v1
    .set macro
    .set reorder

3:
    sll $v0,$a1,2
    lw $v1,D_80073430
    addu $v0,$v0,$a1
    sll $v0,$v0,3
    addu $v0,$v1,$v0
4:
    move $a2,$v0
    or $v0,$a2,$t1
    andi $v0,$v0,3
    .set noreorder
    .set nomacro
    beq $v0,$zero,5f
     move $a3,$t1
    .set macro
    .set reorder

    addu $t0,$a2,32
7:
    lwl $v0,0($a2)
    lwr $v0,3($a2)
    lwl $v1,4($a2)
    lwr $v1,7($a2)
    lwl $a0,8($a2)
    lwr $a0,11($a2)
    lwl $a1,12($a2)
    lwr $a1,15($a2)
    swl $v0,0($a3)
    swr $v0,3($a3)
    swl $v1,4($a3)
    swr $v1,7($a3)
    swl $a0,8($a3)
    swr $a0,11($a3)
    swl $a1,12($a3)
    swr $a1,15($a3)
    addu $a2,$a2,16
    .set noreorder
    .set nomacro
    bne $a2,$t0,7b
     addu $a3,$a3,16
    .set macro
    .set reorder

    j 6f
5:
    addu $t0,$a2,32
8:
    lw $v0,0($a2)
    lw $v1,4($a2)
    lw $a0,8($a2)
    lw $a1,12($a2)
    sw $v0,0($a3)
    sw $v1,4($a3)
    sw $a0,8($a3)
    sw $a1,12($a3)
    addu $a2,$a2,16
    .set noreorder
    .set nomacro
    bne $a2,$t0,8b
     addu $a3,$a3,16
    .set macro
    .set reorder

6:
    lwl $v0,0($a2)
    lwr $v0,3($a2)
    lwl $v1,4($a2)
    lwr $v1,7($a2)
    swl $v0,0($a3)
    swr $v0,3($a3)
    swl $v1,4($a3)
    swr $v1,7($a3)
    lw $v0,D_80073438
    .set noreorder
    .set nomacro
    beq $v0,$zero,10f
     andi $a0,$t2,0xffff
    .set macro
    .set reorder

    .set noreorder
    .set nomacro
    jal func_800372B4
     addu $a1,$t1,14
    .set macro
    .set reorder

    j 10f
2:
    li $v0,0xff
    sb $v0,13($t1)
    sb $v0,14($t1)
10:
    lw $ra,16($sp)
    .set noreorder
    addu $sp,$sp,24
    j $ra
     nop
.end audio_frame_record_copy
