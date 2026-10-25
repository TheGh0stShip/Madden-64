.text
.align 2
.set noreorder
.globl audio_range_value_get
.ent audio_range_value_get
audio_range_value_get:
    sll $v0,$a0,16
    sra $v0,$v0,14
    lui $at,0x8007
    addu $at,$at,$v0
    lw $v1,0x3470($at)
    lb $v0,0($v1)
    beqz $v0,.Lresolve
     move $a2,$zero
    move $a3,$v1
    sll $v0,$a1,16
    sra $a1,$v0,16
.Lloop:
    sll $v0,$a2,16
    sra $v0,$v0,16
    addu $v1,$a3,$v0
    lb $v0,0($v1)
    slt $v0,$a1,$v0
    bnez $v0,.Ladvance
     addiu $v0,$a2,2
    lb $v0,1($v1)
    slt $v0,$v0,$a1
    beqz $v0,.Lresolve
     addiu $v0,$a2,2
.Ladvance:
    sll $v1,$v0,16
    sra $v1,$v1,16
    addu $v1,$a3,$v1
    lb $v1,0($v1)
    bnez $v1,.Lloop
     move $a2,$v0
.Lresolve:
    sll $v0,$a0,16
    sra $v0,$v0,14
    lui $at,0x8007
    addu $at,$at,$v0
    lw $v1,0x3470($at)
    sll $v0,$a2,16
    sra $v0,$v0,16
    addu $v1,$v1,$v0
    lb $v0,0($v1)
    jr $ra
     nop
.end audio_range_value_get
