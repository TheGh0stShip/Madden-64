.text
.align 2
.set noreorder
.globl runtime_entry_find_available
.ent runtime_entry_find_available
runtime_entry_find_available:
    lui $v1,%hi(D_800724DA)
    lbu $v1,%lo(D_800724DA)($v1)
    beqz $v1,.Lmissing
     move $a2,$zero
    lui $t0,%hi(D_800724DC)
    lw $t0,%lo(D_800724DC)($t0)
    andi $a0,$a0,0xffff
    move $a3,$v1
    andi $v1,$a2,0xffff
.Lloop:
    sll $v0,$v1,2
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    addu $a1,$v0,$t0
    lw $v1,8($a1)
    xori $v0,$v1,2
    sltiu $v0,$v0,1
    sltiu $v1,$v1,1
    or $v0,$v0,$v1
    beql $v0,$zero,.Lcheck
     addiu $a2,$a2,1
    lbu $v0,0xc($a1)
    bnel $v0,$zero,.Lcheck
     addiu $a2,$a2,1
    lhu $v0,0($a1)
    sltu $v0,$a0,$v0
    beqz $v0,.Lnext
     sll $v0,$a2,16
    j .Lreturn
     sra $v0,$v0,16
.Lnext:
    addiu $a2,$a2,1
.Lcheck:
    andi $v0,$a2,0xffff
    sltu $v0,$v0,$a3
    bnez $v0,.Lloop
     andi $v1,$a2,0xffff
.Lmissing:
    addiu $v0,$zero,-1
.Lreturn:
    jr $ra
     nop
.end runtime_entry_find_available
