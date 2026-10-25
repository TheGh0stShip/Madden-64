.text
.align 2
.globl audio_frame_header_copy
.ent audio_frame_header_copy
audio_frame_header_copy:
    .frame $sp,0,$ra
    .mask 0x00000000,0
    .fmask 0x00000000,0
    move $a3,$a1
    andi $a0,$a0,0xffff
    sll $v1,$a0,3
    subu $v1,$v1,$a0
    lw $a0,D_80073434
    sll $v0,$v1,5
    subu $v0,$v0,$v1
    addu $a2,$a0,$v0
    or $v0,$a2,$a3
    andi $v0,$v0,3
    .set noreorder
    .set nomacro
    beq $v0,$zero,2f
     addu $t0,$a2,96
    .set macro
    .set reorder

4:
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
    bne $a2,$t0,4b
     addu $a3,$a3,16
    .set macro
    .set reorder

    j 3f
2:
5:
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
    bne $a2,$t0,5b
     addu $a3,$a3,16
    .set macro
    .set reorder

3:
    lwl $v0,0($a2)
    lwr $v0,3($a2)
    lwl $v1,4($a2)
    lwr $v1,7($a2)
    lb $a0,8($a2)
    lb $a1,9($a2)
    swl $v0,0($a3)
    swr $v0,3($a3)
    swl $v1,4($a3)
    swr $v1,7($a3)
    sb $a0,8($a3)
    sb $a1,9($a3)
    lb $v0,10($a2)
    .set noreorder
    .set nomacro
    j $ra
     sb $v0,10($a3)
.end audio_frame_header_copy
