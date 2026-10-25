.text
.align 2
.set noreorder
.globl controller_axes_resolve
.ent controller_axes_resolve
controller_axes_resolve:
    addiu $sp,$sp,-0x28
    sw $s0,0x18($sp)
    move $s0,$a1
    sll $a0,$a0,16
    sra $a0,$a0,16
    sw $ra,0x20($sp)
    sw $s1,0x1c($sp)
    lui $at,0x8009
    addu $at,$at,$a0
    lbu $v1,-0x7f18($at)
    addiu $v0,$zero,1
    beq $v1,$v0,.Ldirect
     move $s1,$a2
    jal controller_flags_resolve
     addiu $a1,$sp,0x10
    lw $v1,0x10($sp)
    andi $v0,$v1,0x800
    sltu $v0,$zero,$v0
    negu $v0,$v0
    andi $a0,$v0,0xb0
    andi $v0,$v1,0x400
    beqz $v0,.Lhorizontal
     move $a1,$zero
    addiu $a0,$zero,0x50
.Lhorizontal:
    andi $v0,$v1,0x200
    bnel $v0,$zero,.Lright
     addiu $a1,$zero,-0x50
.Lright:
    andi $v0,$v1,0x100
    bnel $v0,$zero,.Lstore
     addiu $a0,$zero,0x50
.Lstore:
    sb $a1,0($s0)
    j .Ldone
     sb $a0,0($s1)
.Ldirect:
    lui $at,0x8008
    addu $at,$at,$a0
    lb $v1,0x6de4($at)
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $v0,$v0,1
    lui $at,0x8009
    addu $at,$at,$v0
    lbu $v0,-0x4c4e($at)
    sb $v0,0($s0)
    lui $at,0x8008
    addu $at,$at,$a0
    lb $v1,0x6de4($at)
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $v0,$v0,1
    lui $at,0x8009
    addu $at,$at,$v0
    lbu $v0,-0x4c4d($at)
    sb $v0,0($s1)
.Ldone:
    lw $ra,0x20($sp)
    lw $s1,0x1c($sp)
    lw $s0,0x18($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end controller_axes_resolve
