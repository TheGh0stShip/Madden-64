.text
.align 2
.set noreorder
.globl packed_field_variant_get
.ent packed_field_variant_get
packed_field_variant_get:
    addiu $a1,$a1,-3
    sll $a1,$a1,16
    sra $a1,$a1,16
    sltiu $v0,$a1,9
    beqz $v0,.Lfinish
     move $v1,$zero
    sll $v0,$a1,2
    lui $at,0x8000
    addu $at,$at,$v0
    lw $v0,0x1288($at)
    jr $v0
     nop
.Lcase0:
    lw $v0,4($a0)
    srl $v0,$v0,9
    j .Lfinish
     andi $v1,$v0,0xfff
.Lcase1:
    lw $v0,4($a0)
    j .Lfinish
     srl $v1,$v0,21
.Lcase2:
    lhu $v1,2($a0)
    j .Lreturn
     sll $v0,$v1,16
.Lcase3:
    lw $v0,8($a0)
    j .Lfinish
     srl $v1,$v0,22
.Lcase4:
    lhu $v0,0($a0)
    j .Lfinish
     andi $v1,$v0,0x7f
.Lcase5:
    lw $v0,8($a0)
    srl $v0,$v0,14
    j .Lfinish
     andi $v1,$v0,0xff
.Lcase6:
    lw $v0,4($a0)
    j .Lfinish
     andi $v1,$v0,0x1ff
.Lcase7:
    lw $v0,8($a0)
    sll $v0,$v0,18
    j .Lfinish
     sra $v1,$v0,18
.Lcase8:
    lw $v0,0($a0)
    srl $v0,$v0,23
    andi $v1,$v0,0x7f
.Lfinish:
    sll $v0,$v1,16
.Lreturn:
    jr $ra
     sra $v0,$v0,16
.end packed_field_variant_get
