.text
.align 2
.set noreorder
.globl audio_channel_wait_release
.ent audio_channel_wait_release
audio_channel_wait_release:
    addiu $sp,$sp,-0x18
    sw $ra,0x10($sp)
.Lcheck:
    lui $v0,%hi(D_8007A500)
    lw $v0,%lo(D_8007A500)($v0)
    bnez $v0,.Lreturn
     andi $v1,$a0,0xffff
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $a2,$v0,3
    lui $at,%hi(D_8008B07C)
    addu $at,$at,$a2
    lw $v1,%lo(D_8008B07C)($at)
    sll $v0,$a1,2
    addu $v0,$v0,$v1
    lw $v0,0($v0)
    beqz $v0,.Lrelease
     nop
    lui $at,%hi(D_8008B080)
    addu $at,$at,$a2
    lw $v0,%lo(D_8008B080)($at)
    addu $v0,$v0,$a1
    lbu $v0,0($v0)
    andi $v0,$v0,0x41
    beqz $v0,.Lreturn
     nop
    j .Lcheck
     nop
.Lrelease:
    jal func_80036540
     addu $a0,$zero,$zero
.Lreturn:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end audio_channel_wait_release
