.text
.align 2
.set noreorder
.globl display_buffer_sync
.ent display_buffer_sync
display_buffer_sync:
    lui $v0,0x8009
    lhu $v0,-0x4f90($v0)
    addiu $sp,$sp,-0x18
    sw $ra,0x14($sp)
    andi $v0,$v0,1
    beqz $v0,.Ldone
     sw $s0,0x10($sp)
    lui $s0,0x8009
    lhu $s0,-0x6aea($s0)
    lui $v0,0x8008
    addiu $v0,$v0,0x55d8
    xori $s0,$s0,1
    sll $s0,$s0,2
    jal func_8004E1F8
     addu $s0,$s0,$v0
    lw $v1,0($s0)
    bne $v1,$v0,.Ldone
     nop
    lui $v0,0x8009
    lhu $v0,-0x6aea($v0)
    lui $v1,0x8008
    addiu $v1,$v1,0x6170
    lui $a0,0x8009
    addiu $a0,$a0,-0x4c68
    xori $v0,$v0,1
    sll $v0,$v0,2
    addu $v0,$v0,$v1
    sw $zero,0($v0)
    lui $v0,0x8009
    lhu $v0,-0x4f90($v0)
    move $a1,$zero
    addiu $a2,$zero,1
    andi $v0,$v0,0xfffe
    lui $at,0x8009
    sh $v0,-0x4f90($at)
    jal func_8004CF48
     nop
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end display_buffer_sync
