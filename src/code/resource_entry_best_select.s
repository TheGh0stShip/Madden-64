.text
.align 2
.set noreorder
.globl resource_entry_best_select
.ent resource_entry_best_select
resource_entry_best_select:
    addiu $t0,$zero,-1
    lui $v0,0x8007
    lbu $v0,0x24da($v0)
    addiu $a3,$zero,-1
    beqz $v0,.Lreturn
     move $a2,$zero
    lui $t2,0x8007
    lw $t2,0x24dc($t2)
    move $t1,$v0
    andi $v1,$a2,0xffff
.Lloop:
    sll $v0,$v1,2
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    addu $a1,$v0,$t2
    lw $v1,8($a1)
    xori $v0,$v1,2
    sltiu $v0,$v0,1
    sltiu $v1,$v1,1
    or $v0,$v0,$v1
    beqzl $v0,.Lnext
     addiu $a2,$a2,1
    lbu $v0,0xc($a1)
    bnezl $v0,.Lnext
     addiu $a2,$a2,1
    lhu $v0,0($a1)
    slt $v0,$a0,$v0
    beqzl $v0,.Lnext
     addiu $a2,$a2,1
    lw $v1,0x10($a1)
    sltu $v0,$v1,$a3
    beqzl $v0,.Lnext
     addiu $a2,$a2,1
    move $a3,$v1
    move $t0,$a2
    addiu $a2,$a2,1
.Lnext:
    andi $v0,$a2,0xffff
    sltu $v0,$v0,$t1
    bnez $v0,.Lloop
     andi $v1,$a2,0xffff
.Lreturn:
    sll $v0,$t0,16
    jr $ra
     sra $v0,$v0,16
.end resource_entry_best_select
