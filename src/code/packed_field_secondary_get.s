.text
.align 2
.set noreorder
.globl packed_field_secondary_get
.ent packed_field_secondary_get
packed_field_secondary_get:
    addiu $a1,$a1,-0x10
    sll $a1,$a1,16
    sra $a1,$a1,16
    sltiu $v0,$a1,7
    beqz $v0,.Lextend
     move $v1,$zero
    sll $v0,$a1,2
    lui $at,%hi(D_800012D0)
    addu $at,$at,$v0
    lw $v0,%lo(D_800012D0)($at)
    jr $v0
     nop
.Lcase0:
    lw $v0,4($a0)
    j .Lextend
     srl $v1,$v0,17
.Lcase1:
    lhu $v1,8($a0)
    j .Lreturn
     sll $v0,$v1,16
.Lcase2:
    lw $v0,0($a0)
    srl $v0,$v0,18
    j .Lextend
     andi $v1,$v0,0xfff
.Lcase3:
    lw $v0,0($a0)
    srl $v0,$v0,6
    j .Lextend
     andi $v1,$v0,0xfff
.Lcase4:
    lhu $v1,0xa($a0)
    j .Lreturn
     sll $v0,$v1,16
.Lcase5:
    lw $v0,4($a0)
    srl $v0,$v0,9
    j .Lextend
     andi $v1,$v0,0xff
.Lcase6:
    lw $v0,4($a0)
    andi $v1,$v0,0x1ff
.Lextend:
    sll $v0,$v1,16
.Lreturn:
    jr $ra
     sra $v0,$v0,16
.end packed_field_secondary_get
