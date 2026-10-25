.text
.align 2
.set noreorder
.globl display_env_color_set
.ent display_env_color_set
display_env_color_set:
    lui $v0,0x8009
    lw $v0,-0x78c4($v0)
    move $t0,$a0
    bne $v0,$t0,.Lemit
     nop
    lui $v0,0x8009
    lw $v0,-0x78c0($v0)
    bne $v0,$a1,.Lemit
     nop
    lui $v0,0x8009
    lw $v0,-0x78bc($v0)
    bne $v0,$a2,.Lemit
     nop
    lui $v0,0x8009
    lw $v0,-0x78b8($v0)
    beq $v0,$a3,.Ldone
     nop
.Lemit:
    lui $a0,0x8008
    lw $a0,0x4f5c($a0)
    sll $v1,$t0,24
    addiu $v0,$a0,8
    lui $at,0x8008
    sw $v0,0x4f5c($at)
    lui $v0,0xfb00
    sw $v0,0($a0)
    andi $v0,$a1,0xff
    sll $v0,$v0,16
    or $v1,$v1,$v0
    andi $v0,$a2,0xff
    sll $v0,$v0,8
    or $v1,$v1,$v0
    andi $v0,$a3,0xff
    or $v1,$v1,$v0
    sw $v1,4($a0)
    lui $at,0x8009
    sw $t0,-0x78c4($at)
    lui $at,0x8009
    sw $a1,-0x78c0($at)
    lui $at,0x8009
    sw $a2,-0x78bc($at)
    lui $at,0x8009
    sw $a3,-0x78b8($at)
.Ldone:
    jr $ra
     nop
.end display_env_color_set
