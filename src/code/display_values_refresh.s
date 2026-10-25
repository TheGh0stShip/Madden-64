.text
.align 2
.set noreorder
.globl display_values_refresh
.ent display_values_refresh
display_values_refresh:
    lui $v1,%hi(D_80088620)
    lw $v1,%lo(D_80088620)($v1)
    lui $v0,%hi(D_80086180)
    lw $v0,%lo(D_80086180)($v0)
    beq $v1,$v0,.Ldone
     addiu $sp,$sp,-8
    lui $v0,%hi(D_80086DA8)
    lh $v0,%lo(D_80086DA8)($v0)
    blez $v0,.Lupdate
     move $a0,$zero
    move $a2,$v0
    lui $a1,%hi(D_80087100)
    addiu $a1,$a1,%lo(D_80087100)
.Lloop:
    lui $at,0x8008
    addu $at,$at,$a0
    lb $v1,0x6de4($at)
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $v0,$v0,1
    lui $at,0x8009
    addu $at,$at,$v0
    lhu $v0,-0x4c50($at)
    addiu $a0,$a0,1
    andi $v0,$v0,0xff3f
    sw $v0,0($a1)
    slt $v0,$a0,$a2
    bnez $v0,.Lloop
     addiu $a1,$a1,4
.Lupdate:
    lui $v0,%hi(D_80088620)
    lw $v0,%lo(D_80088620)($v0)
    lui $at,%hi(D_80086180)
    sw $v0,%lo(D_80086180)($at)
.Ldone:
    addiu $sp,$sp,8
    jr $ra
     nop
.end display_values_refresh
