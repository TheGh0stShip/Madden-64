.text
.align 2
.set noreorder
.globl audio_level_calculate
.ent audio_level_calculate
audio_level_calculate:
    addiu $a1,$a1,1
    slti $v0,$a1,0x81
    beqz $v0,.Lbounded
     addiu $v1,$zero,0x80
    move $v1,$a1
.Lbounded:
    move $a1,$v1
    nor $v0,$zero,$a1
    lui $v1,%hi(D_80073508)
    lw $v1,%lo(D_80073508)($v1)
    sra $v0,$v0,31
    and $a1,$a1,$v0
    addiu $v1,$v1,1
    mult $a1,$v1
    mflo $a1
    beqz $a2,.Lsecondary
     sll $v0,$a0,4
    lui $at,0x8008
    addu $at,$at,$v0
    lw $v0,0x7b7c($at)
    j .Lscale
     nop
.Lsecondary:
    lui $at,0x8008
    addu $at,$at,$v0
    lw $v0,0x7b78($at)
.Lscale:
    .word 0x00a20018
    mflo $a1
    sra $a1,$a1,14
    slti $v0,$a1,0x10
    beql $v0,$zero,.Lnonnegative
     addiu $a1,$zero,0xf
.Lnonnegative:
    nor $v0,$zero,$a1
    sra $v0,$v0,31
    jr $ra
     and $v0,$a1,$v0
.end audio_level_calculate
