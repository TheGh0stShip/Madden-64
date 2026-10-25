.text
.align 2
.set noreorder
.globl packed_field_extended_get
.ent packed_field_extended_get
packed_field_extended_get:
    addiu $a1,$a1,-0x17
    sll $a1,$a1,16
    sra $a1,$a1,16
    sltiu $v0,$a1,0x12
    beqz $v0,.Lfinish
     move $v1,$zero
    sll $v0,$a1,2
    lui $at,0x8000
    addu $at,$at,$v0
    lw $v0,0x12f0($at)
    jr $v0
     nop
.Lcase0:
    lw $v0,8($a0)
    j .Lfinish
     srl $v1,$v0,22
.Lcase1:
    lw $v0,4($a0)
    j .Lfinish
     srl $v1,$v0,23
.Lcase2:
    lw $v0,0($a0)
    j .Lfinish
     andi $v1,$v0,0x7f
.Lcase3:
    lw $v0,4($a0)
    j .Lfinish
     andi $v1,$v0,0x7f
.Lcase4:
    lw $v0,4($a0)
    srl $v0,$v0,15
    j .Lfinish
     andi $v1,$v0,0xff
.Lcase5:
    lw $v0,4($a0)
    j .Lmask8
     srl $v0,$v0,7
.Lcase6:
    lw $v0,8($a0)
    srl $v0,$v0,7
    j .Lfinish
     andi $v1,$v0,0x1f
.Lcase7:
    lw $v0,8($a0)
    srl $v0,$v0,12
    j .Lfinish
     andi $v1,$v0,0x3ff
.Lcase8:
    lw $v0,0($a0)
    srl $v0,$v0,15
    j .Lfinish
     andi $v1,$v0,0x7fff
.Lcase9:
    lw $v0,0($a0)
    srl $v0,$v0,7
.Lmask8:
    j .Lfinish
     andi $v1,$v0,0xff
.Lcase10:
    lw $v0,8($a0)
    andi $v1,$v0,0x7f
.Lfinish:
    jr $ra
     move $v0,$v1
.end packed_field_extended_get
