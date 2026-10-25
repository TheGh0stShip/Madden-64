.text
.align 2
.set noreorder
.globl audio_channel_find
.ent audio_channel_find
audio_channel_find:
    lb $v0,4($a1)
    move $a2,$zero
    lbu $a3,0($a0)
    sll $v1,$v0,1
    addu $v1,$v1,$v0
    sll $v0,$v1,4
    subu $v0,$v0,$v1
    sll $a0,$v0,1
    sll $v0,$a2,16
.Lloop:
    sra $v1,$v0,16
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $v0,$v0,1
    addu $v0,$v0,$a0
    addu $v0,$a1,$v0
    lbu $v0,0x42($v0)
    bne $v0,$a3,.Lnext
     addiu $v0,$a2,1
    j .Lreturn
     move $v0,$v1
.Lnext:
    move $a2,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,15
    bnez $v0,.Lloop
     sll $v0,$a2,16
    move $v0,$zero
.Lreturn:
    jr $ra
     nop
.end audio_channel_find
