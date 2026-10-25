.text
.align 2
.set noreorder
.globl packed_field_primary_get
.ent packed_field_primary_get
packed_field_primary_get:
    addiu $a1,$a1,-9
    sll $a1,$a1,16
    sra $a1,$a1,16
    sltiu $v0,$a1,7
    beqz $v0,.Lextend
     move $v1,$zero
    sll $v0,$a1,2
    lui $at,%hi(D_800012B0)
    addu $at,$at,$v0
    lw $v0,%lo(D_800012B0)($at)
    jr $v0
     nop
.Lcase0:
    lw $v0,0($a0)
    srl $v0,$v0,15
    j .Lextend
     andi $v1,$v0,0x7fff
.Lcase1:
    lhu $v1,8($a0)
    j .Lreturn
     sll $v0,$v1,16
.Lcase2:
    lw $v0,4($a0)
    j .Lextend
     andi $v1,$v0,0xfff
.Lcase3:
    lw $v0,4($a0)
    srl $v0,$v0,12
    j .Lextend
     andi $v1,$v0,0xff
.Lcase4:
    lw $v0,0($a0)
    j .Lextend
     andi $v1,$v0,0x7fff
.Lcase5:
    lhu $v1,0xa($a0)
    j .Lreturn
     sll $v0,$v1,16
.Lcase6:
    lw $v0,4($a0)
    srl $v1,$v0,20
.Lextend:
    sll $v0,$v1,16
.Lreturn:
    jr $ra
     sra $v0,$v0,16
.end packed_field_primary_get
