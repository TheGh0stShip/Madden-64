.text
.align 2
.set noreorder
.globl roster_attribute_find
.ent roster_attribute_find
roster_attribute_find:
    move $a3,$zero
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
    andi $a2,$a2,0xffff
    lui $a0,%hi(D_800816A7)
    addiu $a0,$a0,%lo(D_800816A7)
    sll $v1,$a2,1
    addu $v1,$v1,$a2
    sll $v1,$v1,2
    subu $v1,$v1,$a2
    addu $v0,$v0,$a0
    addu $v1,$v1,$v0
    andi $a1,$a1,0xffff
    andi $v0,$a3,0xffff
.Lloop:
    addu $v0,$v1,$v0
    lbu $v0,0($v0)
    bnel $v0,$a1,.Lnext
     addiu $a3,$a3,1
    sll $v0,$a3,16
    j .Lreturn
     sra $v0,$v0,16
.Lnext:
    andi $v0,$a3,0xffff
    sltiu $v0,$v0,11
    bnez $v0,.Lloop
     andi $v0,$a3,0xffff
    addiu $v0,$zero,-1
.Lreturn:
    jr $ra
     nop
.end roster_attribute_find
