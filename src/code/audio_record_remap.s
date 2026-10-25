.text
.align 2
.set noreorder
.globl audio_record_remap
.ent audio_record_remap
audio_record_remap:
    lbu $v0,0($a0)
    addiu $v1,$v0,-4
    sltiu $v0,$v1,0x2c
    beqz $v0,.Ldone
     sll $v0,$v1,2
    lui $at,0x8000
    addu $at,$at,$v0
    lw $v0,0x2a68($at)
    jr $v0
     nop
.Lcase0:
    lbu $a3,2($a0)
    addiu $v0,$a3,-0x80
    negu $v0,$v0
    andi $v0,$v0,0x7f
    j .Ldone
     sb $v0,2($a0)
.Lcase1:
    lbu $v1,2($a0)
    addiu $v0,$zero,0xb
    beq $v1,$v0,.Lto12
     addiu $v0,$zero,0xc
    beq $v1,$v0,.Lto11
     addiu $v0,$zero,0xb
    j .Lsecond
     nop
.Lto12:
    addiu $v0,$zero,0xc
.Lto11:
    sb $v0,2($a0)
.Lsecond:
    lbu $a3,3($a0)
    addiu $v0,$a3,-0x80
    negu $v0,$v0
    andi $v0,$v0,0x7f
    j .Ldone
     sb $v0,3($a0)
.Lcase2:
    move $a3,$zero
    addiu $t2,$zero,7
    addiu $t1,$zero,8
    addiu $t0,$zero,0xa
.Lloop:
    sll $v0,$a3,16
.Lrepeat:
    sra $v0,$v0,16
    addu $a1,$a0,$v0
    lbu $a2,1($a1)
    andi $v1,$a2,0xff
    sltiu $v0,$v1,8
    beqz $v0,.Leight
     subu $v0,$t2,$a2
    j .Lnext
     sb $v0,1($a1)
.Leight:
    bne $v1,$t1,.Lten
     nop
    j .Lnext
     sb $t0,1($a1)
.Lten:
    beql $v1,$t0,.Lnext
     sb $t1,1($a1)
.Lnext:
    addiu $v0,$a3,1
    move $a3,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,3
    bnez $v0,.Lrepeat
     sll $v0,$a3,16
.Ldone:
    jr $ra
     nop
.end audio_record_remap
