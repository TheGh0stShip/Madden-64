.text
.align 2
.set noreorder
.globl runtime_entry_find
.ent runtime_entry_find
runtime_entry_find:
    lui $v0,%hi(D_800724DA)
    lbu $v0,%lo(D_800724DA)($v0)
    addiu $sp,$sp,-8
    beqz $v0,.Lmissing
     move $a2,$zero
    andi $v0,$a0,0xff00
    srl $a0,$v0,8
    move $v1,$zero
.Lloop:
    lui $v0,%hi(D_800724DC)
    lw $v0,%lo(D_800724DC)($v0)
    addu $v0,$v1,$v0
    lbu $v0,0xd($v0)
    bnel $v0,$a0,.Lnext
     addiu $a2,$a2,1
    sh $a2,0($a1)
    lui $v0,%hi(D_800724DC)
    lw $v0,%lo(D_800724DC)($v0)
    addu $v0,$v1,$v0
    lhu $v0,0xa($v0)
    j .Ldone
     nop
.Lnext:
    lui $v0,%hi(D_800724DA)
    lbu $v0,%lo(D_800724DA)($v0)
    sltu $v0,$a2,$v0
    bnez $v0,.Lloop
     addiu $v1,$v1,0x14
.Lmissing:
    addiu $v0,$zero,-1
    sh $v0,0($a1)
    addiu $v0,$zero,3
.Ldone:
    addiu $sp,$sp,8
    jr $ra
     nop
.end runtime_entry_find
