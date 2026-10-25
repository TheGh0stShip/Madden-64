.text
.align 2
.set noreorder
.globl runtime_entries_reset
.ent runtime_entries_reset
runtime_entries_reset:
    lui $v0,%hi(D_800724DA)
    lbu $v0,%lo(D_800724DA)($v0)
    addiu $sp,$sp,-8
    beqz $v0,.Ldone
     move $a1,$zero
    addiu $a3,$zero,2
    addiu $a2,$zero,0xff
    move $a0,$zero
.Lloop:
    lui $v1,%hi(D_800724DC)
    lw $v1,%lo(D_800724DC)($v1)
    addu $v1,$a0,$v1
    sb $zero,0xc($v1)
    lui $v0,%hi(D_800724DC)
    lw $v0,%lo(D_800724DC)($v0)
    sw $a3,8($v1)
    addu $v0,$a0,$v0
    sb $a2,0xd($v0)
    lui $v0,%hi(D_800724DC)
    lw $v0,%lo(D_800724DC)($v0)
    addiu $a1,$a1,1
    lui $v1,%hi(D_800724DA)
    lbu $v1,%lo(D_800724DA)($v1)
    addu $v0,$a0,$v0
    addiu $a0,$a0,0x14
    sltu $v1,$a1,$v1
    bnez $v1,.Lloop
     sw $zero,0x10($v0)
.Ldone:
    addiu $sp,$sp,8
    jr $ra
     nop
.end runtime_entries_reset
