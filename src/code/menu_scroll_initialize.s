.text
.align 2
.set noreorder
.globl menu_scroll_initialize
.ent menu_scroll_initialize
menu_scroll_initialize:
    lui $v1,%hi(D_8008A748)
    lw $v1,%lo(D_8008A748)($v1)
    lui $a1,%hi(D_80084F34)
    addiu $a1,$a1,%lo(D_80084F34)
    lui $a0,0xfce0
    slt $v0,$v1,$a0
    beqz $v0,.Lupper
     sw $v1,0($a1)
    lui $v0,%hi(D_80087AF0)
    lh $v0,%lo(D_80087AF0)($v0)
    blez $v0,.Lbounded
     sw $a0,0($a1)
    lui $v0,0xfe20
    j .Lbounded
     sw $v0,0($a1)
.Lupper:
    lui $a0,0x0320
    slt $v0,$a0,$v1
    bnel $v0,$zero,.Lbounded
     sw $a0,0($a1)
.Lbounded:
    lui $v0,%hi(D_8008A748)
    lw $v0,%lo(D_8008A748)($v0)
    lui $v1,0x00a0
    addu $v0,$v0,$v1
    lui $v1,0x0320
    lui $at,%hi(D_8008793C)
    sw $v0,%lo(D_8008793C)($at)
    slt $v0,$v1,$v0
    beqz $v0,.Lflag
     nop
    lui $at,%hi(D_8008793C)
    sw $v1,%lo(D_8008793C)($at)
.Lflag:
    lui $v0,%hi(D_8008777C)
    addiu $v0,$v0,%lo(D_8008777C)
    lhu $v1,0($v0)
    addiu $a0,$zero,1
    lui $at,%hi(D_80089320)
    sh $a0,%lo(D_80089320)($at)
    ori $v1,$v1,8
    jr $ra
     sh $v1,0($v0)
.end menu_scroll_initialize
