.text
.align 2
.set noreorder
.globl league_best_player_find
.ent league_best_player_find
league_best_player_find:
    addiu $sp,$sp,-0x30
    sw $s4,0x20($sp)
    move $s4,$zero
    lui $v0,0x8008
    addiu $v0,$v0,0xcfc
    sw $ra,0x28($sp)
    sw $s5,0x24($sp)
    sw $s3,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lhu $s5,0($v0)
    move $s2,$zero
    move $s3,$v0
.Lteam:
    move $s0,$zero
    move $s1,$s3
.Lplayer:
    lhu $v1,0($s1)
    ori $v0,$zero,0xffff
    beql $v1,$v0,.Lnext
     addiu $s0,$s0,1
    andi $a0,$s2,0xffff
    jal func_80022AD8
     andi $a1,$s0,0xffff
    andi $v0,$v0,0xff
    sltiu $v0,$v0,0xa
    beql $v0,$zero,.Lnext
     addiu $s0,$s0,1
    move $a0,$s2
    jal func_8002A358
     move $a1,$s0
    move $v1,$v0
    sltu $v0,$s4,$v1
    beqz $v0,.Lnext
     addiu $s0,$s0,1
    lhu $s5,0($s1)
    move $s4,$v1
.Lnext:
    slti $v0,$s0,0x37
    bnez $v0,.Lplayer
     addiu $s1,$s1,2
    addiu $s2,$s2,1
    slti $v0,$s2,2
    bnez $v0,.Lteam
     addiu $s3,$s3,0x214c
    move $v0,$s5
    lw $ra,0x28($sp)
    lw $s5,0x24($sp)
    lw $s4,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x30
    jr $ra
     nop
.end league_best_player_find
