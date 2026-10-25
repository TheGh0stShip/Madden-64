.text
.align 2
.set noreorder
.globl audio_slot_active_test
.ent audio_slot_active_test
audio_slot_active_test:
    lbu $v1,0x1e($a0)
    move $a2,$zero
    addiu $a3,$zero,0x80
    lui $a1,0x8008
    addiu $a1,$a1,0x1860
    sll $v0,$v1,5
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    subu $v0,$v0,$v1
    lbu $v1,0x1f($a0)
    sll $v0,$v0,2
    addu $a0,$v0,$a1
    addiu $a1,$a1,-0xb64
    sll $v1,$v1,1
    addu $v1,$v1,$a0
    lh $v1,0($v1)
    move $a0,$v0
    addu $a1,$a0,$a1
    sll $v1,$v1,1
    addu $v1,$v1,$a1
    lhu $a1,0($v1)
    sll $v0,$a2,16
.Lloop:
    sra $v0,$v0,14
    addu $v1,$v0,$a0
    lui $at,0x8008
    addu $at,$at,$v1
    lhu $v0,0x2d84($at)
    bne $v0,$a1,.Lnext
     addiu $v0,$a2,1
    lui $at,0x8008
    addu $at,$at,$v1
    lbu $v0,0x2d87($at)
    beq $v0,$a3,.Lnext
     addiu $v0,$a2,1
    j .Lreturn
     addiu $v0,$zero,1
.Lnext:
    move $a2,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,4
    bnez $v0,.Lloop
     sll $v0,$a2,16
.Lnone:
    move $v0,$zero
.Lreturn:
    jr $ra
     nop
.end audio_slot_active_test
