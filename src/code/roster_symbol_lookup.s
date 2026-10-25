.text
.align 2
.set noreorder
.globl roster_symbol_lookup
.ent roster_symbol_lookup
roster_symbol_lookup:
    andi $a0,$a0,0xffff
    sll $v0,$a0,5
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    subu $v0,$v0,$a0
    sll $v0,$v0,2
    lui $v1,%hi(D_80080D6A)
    addiu $v1,$v1,%lo(D_80080D6A)
    addu $v0,$v0,$v1
    andi $a1,$a1,0xffff
    sll $v1,$a1,2
    addu $v1,$v1,$a1
    sll $v1,$v1,3
    addu $v0,$v0,$v1
    addiu $a0,$v0,0xf
    andi $v1,$a2,0xffff
    sltiu $v0,$v1,0x15
    bnez $v0,.Ldirect
     addu $v0,$a0,$v1
    addu $v0,$v1,$a0
    lbu $v1,-0x15($v0)
    j .Ladjust
     andi $v0,$a2,0xffff
.Ldirect:
    lbu $v1,0($v0)
    andi $v0,$a2,0xffff
.Ladjust:
    beql $v0,$zero,.Lreturn
     addiu $v1,$v1,0x91
.Lreturn:
    jr $ra
     andi $v0,$v1,0xffff
.end roster_symbol_lookup
