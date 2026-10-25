.text
.align 2
.set noreorder
.globl vector_slot_negate_store
.ent vector_slot_negate_store
vector_slot_negate_store:
    addiu $sp,$sp,-0x20
    move $t0,$a0
    sw $s0,0x10($sp)
    move $s0,$a2
    sw $s1,0x14($sp)
    andi $s1,$a3,0xff
    beqz $s1,.Lactive_done
     sw $ra,0x18($sp)
    andi $a0,$s0,0xff
    sll $v1,$a0,2
    lw $v0,0($t0)
    addu $v1,$v1,$a0
    sll $v1,$v1,3
    negu $v0,$v0
    lui $at,0x8008
    addu $at,$at,$v1
    sw $v0,-0x7d00($at)
    lw $v0,8($t0)
    negu $v0,$v0
    lui $at,0x8008
    addu $at,$at,$v1
    sw $v0,-0x7cfc($at)
    lw $v0,4($t0)
    negu $v0,$v0
    lui $at,0x8008
    addu $at,$at,$v1
    sw $v0,-0x7cf8($at)
    jal func_8000E05C
     nop
.Lactive_done:
    andi $v1,$s0,0xff
    sll $v0,$v1,2
    addu $v0,$v0,$v1
    sll $v0,$v0,3
    lui $at,0x8008
    addu $at,$at,$v0
    sw $s1,-0x7ce0($at)
.Ldone:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end vector_slot_negate_store
