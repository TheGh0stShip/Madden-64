.text
.align 2
.set noreorder
.globl texture_scale_configure
.ent texture_scale_configure
texture_scale_configure:
    andi $v0,$a1,0xff
    sltiu $v0,$v0,0x3c
    beqz $v0,.Lupper
     move $a3,$a0
    addiu $a1,$zero,0x3c
.Lupper:
    andi $v0,$a1,0xff
    sltiu $v0,$v0,0x57
    beql $v0,$zero,.Lbounded
     addiu $a1,$zero,0x56
.Lbounded:
    andi $v0,$a1,0xff
    sll $v0,$v0,2
    addiu $v0,$v0,-0x35
    move $t0,$v0
    lui $t1,2
    ori $t1,$t1,0x6666
    sw $v0,0x3c($a3)
    mult $t0,$t1
    mfhi $t6
    mflo $t7
    sll $t6,$t6,16
    srl $t7,$t7,16
    or $t0,$t6,$t7
    lui $a0,1
    andi $v1,$a2,0xff
    sll $v0,$v1,6
    addu $v0,$v0,$a0
    sll $v1,$v1,5
    addu $v1,$v1,$a0
    sw $t0,0x3c($a3)
    sw $a0,0x40($a3)
    sw $v0,0x44($a3)
    jr $ra
     sw $v1,0x48($a3)
.end texture_scale_configure
