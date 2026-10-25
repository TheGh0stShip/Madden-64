.text
.align 2
.set noreorder
.globl text_glyph_width_sum
.ent text_glyph_width_sum
text_glyph_width_sum:
    lbu $t0,0($a0)
    beqz $t0,.Lreturn
     move $t2,$zero
    addiu $t4,$zero,0x2d
    addiu $t3,$zero,0x2e
.Lloop:
    andi $t1,$t0,0xff
.Lrepeat:
    xori $v1,$t1,0x20
    sltiu $v1,$v1,1
    xori $v0,$t1,0x27
    sltiu $v0,$v0,1
    or $v1,$v1,$v0
    beqz $v1,.Lletter
     addiu $v0,$t2,2
    j .Lnext
     addu $t2,$a2,$v0
.Lletter:
    addiu $v1,$t0,-0x41
    andi $v0,$v1,0xff
    sltiu $v0,$v0,0x1a
    beql $v0,$zero,.Ldigit_test
     addiu $v1,$t0,-0x30
    j .Llookup
     move $t0,$v1
.Ldigit_test:
    andi $v0,$v1,0xff
    sltiu $v0,$v0,0xa
    beqz $v0,.Ldash
     nop
    j .Llookup
     addiu $t0,$v1,0x1a
.Ldash:
    bne $t1,$t4,.Lperiod
     nop
    j .Llookup
     addiu $t0,$zero,0x24
.Lperiod:
    beql $t1,$t3,.Llookup
     addiu $t0,$zero,0x25
.Llookup:
    addu $t0,$t0,$a3
    andi $v0,$t0,0xff
    sll $v0,$v0,1
    addu $v0,$v0,$a1
    lhu $v0,2($v0)
    lhu $v1,0($a1)
    addiu $v0,$v0,2
    sll $v1,$v1,1
    addu $v0,$v0,$v1
    addu $v0,$a1,$v0
    lbu $v0,2($v0)
    addu $t2,$t2,$v0
.Lnext:
    addiu $a0,$a0,1
    lbu $t0,0($a0)
    bnez $t0,.Lrepeat
     andi $t1,$t0,0xff
.Lreturn:
    jr $ra
     andi $v0,$t2,0xffff
.end text_glyph_width_sum
