.text
.align 2
.set noreorder
.globl object_chain_release
.ent object_chain_release
object_chain_release:
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x14($sp)
    lw $v0,8($s0)
    beqz $v0,.Lunlink
     nop
.Lchildren:
    lw $a1,8($s0)
    jal func_8000D998
     move $a0,$s0
    lw $v0,8($s0)
    bnez $v0,.Lchildren
     nop
.Lunlink:
    lui $v0,0x8006
    lw $v0,0x4ba8($v0)
    bne $s0,$v0,.Lmiddle
     nop
    lw $v0,4($s0)
    lui $at,0x8006
    sw $v0,0x4ba8($at)
    bnezl $v0,.Lfree
     sw $zero,0($v0)
    j .Lfree
     nop
.Lmiddle:
    lw $v1,4($s0)
    beqz $v1,.Ltail
     nop
    lw $v0,0($s0)
    bnezl $v0,.Lnext
     sw $v1,4($v0)
.Lnext:
    lw $v1,4($s0)
    beqz $v1,.Lfree
     nop
    lw $v0,0($s0)
    j .Lfree
     sw $v0,0($v1)
.Ltail:
    lw $v0,0($s0)
    sw $zero,4($v0)
.Lfree:
    lui $a0,0x8008
    lw $a0,-0x7d10($a0)
    jal func_800332C8
     move $a1,$s0
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end object_chain_release
