.text
.align 2
.globl audio_frame_payload_copy
.ent audio_frame_payload_copy
audio_frame_payload_copy:
    .frame $sp,24,$ra
    .mask 0x80010000,-4
    .fmask 0x00000000,0
    lhu $v0,D_8008AF9C
    subu $sp,$sp,24
    sw $s0,16($sp)
    move $s0,$a1
    .set noreorder
    .set nomacro
    bne $v0,$zero,2f
     sw $ra,20($sp)
    .set macro
    .set reorder

    andi $v0,$a0,0xffff
    sll $v1,$v0,3
    subu $v1,$v1,$v0
    lw $a0,D_80073434
    sll $v0,$v1,5
    subu $v0,$v0,$v1
    addu $v0,$a0,$v0
    .set noreorder
    .set nomacro
    j 3f
     addu $v0,$v0,107
    .set macro
    .set reorder

2:
    .set noreorder
    .set nomacro
    jal func_80028A58
     andi $a0,$a0,0xffff
    .set macro
    .set reorder

    andi $v0,$v0,0xffff
    sll $v1,$v0,3
    subu $v1,$v1,$v0
    sll $v1,$v1,3
    lw $a0,D_80073438
    subu $v1,$v1,$v0
    sll $v1,$v1,1
    addu $v0,$a0,$v1
3:
    move $a3,$s0
    move $a2,$v0
    or $v0,$a2,$a3
    andi $v0,$v0,3
    .set noreorder
    .set nomacro
    beq $v0,$zero,4f
     addu $t0,$a2,96
    .set macro
    .set reorder

6:
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
    bne $a2,$t0,6b
     addu $a3,$a3,16
    .set macro
    .set reorder

    j 5f
4:
7:
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
    bne $a2,$t0,7b
     addu $a3,$a3,16
    .set macro
    .set reorder

5:
    lwl $v0,0($a2)
    lwr $v0,3($a2)
    lwl $v1,4($a2)
    lwr $v1,7($a2)
    lwl $a0,8($a2)
    lwr $a0,11($a2)
    lb $a1,12($a2)
    swl $v0,0($a3)
    swr $v0,3($a3)
    swl $v1,4($a3)
    swr $v1,7($a3)
    swl $a0,8($a3)
    swr $a0,11($a3)
    sb $a1,12($a3)
    lb $v0,13($a2)
    sb $v0,13($a3)
    lw $ra,20($sp)
    lw $s0,16($sp)
    .set noreorder
    addu $sp,$sp,24
    j $ra
     nop
.end audio_frame_payload_copy
