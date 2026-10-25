.text
.align 2
.set noreorder
.globl object_display_segment_enable
.ent object_display_segment_enable
object_display_segment_enable:
    move $t0,$a0
    lhu $v1,0x1ea($t0)
    addiu $v0,$zero,1
    beq $v1,$v0,.Ldone
     lui $a2,0x0103
    ori $a2,$a2,0x40
    lui $a1,0x8000
    ori $a1,$a1,0xa8
    lui $a3,0x0102
    lui $a0,%hi(D_80084F5C)
    lw $a0,%lo(D_80084F5C)($a0)
    lui $v0,%hi(D_8008AFD4)
    lhu $v0,%lo(D_8008AFD4)($v0)
    ori $a3,$a3,0x40
    addu $a1,$t0,$a1
    addiu $v1,$a0,8
    lui $at,%hi(D_80084F5C)
    sw $v1,%lo(D_80084F5C)($at)
    addiu $v1,$a0,0x10
    sll $v0,$v0,6
    addiu $v0,$v0,0x168
    addu $v0,$t0,$v0
    lui $at,%hi(D_80084F5C)
    sw $v1,%lo(D_80084F5C)($at)
    lui $v1,0x8000
    subu $v0,$v0,$v1
    sw $v0,0xc($a0)
    addiu $v0,$zero,1
    sw $a2,0($a0)
    sw $a1,4($a0)
    sw $a3,8($a0)
    sh $v0,0x1ea($t0)
.Ldone:
    jr $ra
     nop
.end object_display_segment_enable
