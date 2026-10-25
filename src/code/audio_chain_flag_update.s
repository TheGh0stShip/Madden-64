.text
.align 2
.set noreorder
.globl audio_chain_flag_update
.ent audio_chain_flag_update
audio_chain_flag_update:
    lw $v0,8($a0)
    lw $v1,0($v0)
    lw $a0,4($v0)
    lh $a2,4($v1)
    lh $v0,6($v1)
    sll $a1,$a1,24
    lw $v1,0xc($a0)
    beqz $a1,.Lclear
     addu $a2,$a2,$v0
    addiu $a0,$zero,1
.Lset_loop:
    move $v0,$a2
    beqz $v0,.Ldone
     addiu $a2,$a2,-1
.Lset_body:
    beqz $v1,.Lset_next
     move $v0,$a2
    lw $v0,0x14($v1)
    or $v0,$v0,$a0
    sw $v0,0x14($v1)
    lw $v1,0($v1)
    move $v0,$a2
.Lset_next:
    bnez $v0,.Lset_body
     addiu $a2,$a2,-1
    j .Ldone
     nop
.Lclear:
    move $v0,$a2
    beqz $v0,.Ldone
     addiu $a2,$a2,-1
    addiu $a0,$zero,-2
.Lclear_loop:
    beqz $v1,.Lclear_next
     move $v0,$a2
    lw $v0,0x14($v1)
    and $v0,$v0,$a0
    sw $v0,0x14($v1)
    lw $v1,0($v1)
    move $v0,$a2
.Lclear_next:
    bnez $v0,.Lclear_loop
     addiu $a2,$a2,-1
.Ldone:
    jr $ra
     nop
.end audio_chain_flag_update
