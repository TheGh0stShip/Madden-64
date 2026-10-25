.text
.align 2
.set noreorder
.globl audio_record_field_get
.ent audio_record_field_get
audio_record_field_get:
    andi $a1,$a1,0xffff
    sltiu $v0,$a1,5
    beqz $v0,.Lreturn
     addiu $v1,$zero,0xb
    sll $v0,$a1,2
    lui $at,0x8000
    addu $at,$at,$v0
    lw $v0,0x2e70($at)
    jr $v0
     nop
.Lcase0:
    lbu $v0,2($a0)
    sll $v0,$v0,3
    lui $at,0x8007
    addu $at,$at,$v0
    lb $v1,0x3e28($at)
    j .Lreturn
     nop
.Lcase1:
    lbu $v0,2($a0)
    sll $v0,$v0,3
    lui $at,0x8007
    addu $at,$at,$v0
    lw $v1,0x3e24($at)
    j .Lreturn
     nop
.Lcase2:
    lhu $v1,0($a0)
    j .Lreturn
     nop
.Lcase3:
    lbu $v1,3($a0)
    j .Lreturn
     nop
.Lcase4:
    move $a1,$zero
    lbu $a0,2($a0)
.Lscan:
    sll $v0,$a1,16
.Lrepeat:
    sra $v1,$v0,14
    lui $at,0x8007
    addu $at,$at,$v1
    lbu $v0,0x40a4($at)
    sltu $v0,$a0,$v0
    bnez $v0,.Lincrement
     addiu $v0,$a1,1
    lui $at,0x8007
    addu $at,$at,$v1
    lbu $v0,0x40a5($at)
    sltu $v0,$v0,$a0
    beqz $v0,.Lselected
     sll $v0,$a1,16
    addiu $v0,$a1,1
.Lincrement:
    move $a1,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,6
    bnez $v0,.Lrepeat
     sll $v0,$a1,16
.Lselected:
    sra $v1,$v0,16
.Lreturn:
    jr $ra
     move $v0,$v1
.end audio_record_field_get
