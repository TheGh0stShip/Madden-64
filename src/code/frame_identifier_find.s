.text
.align 2
.set noreorder
.globl frame_identifier_find
.ent frame_identifier_find
frame_identifier_find:
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    sw $ra,0x14($sp)
    jal func_8002B5EC
     move $s0,$a0
    sll $v0,$v0,16
    sra $v0,$v0,16
    addiu $v1,$zero,1
    bne $v0,$v1,.Lother_setup
     nop
    lui $v0,0x800c
    lbu $v0,0x4eeb($v0)
    lui $a2,0x8008
    addiu $a2,$a2,0x6190
    sll $v0,$v0,24
    j .Lsearch_setup
     sra $v0,$v0,24
.Lreturn_arg:
    j .Lreturn
     move $v0,$a1
.Lother_setup:
    lui $a2,0x8007
    addiu $a2,$a2,-0x461c
    lui $v0,0x8007
    lhu $v0,-0x4620($v0)
.Lsearch_setup:
    andi $v0,$v0,0xffff
    beqz $v0,.Lnot_found
     move $v1,$zero
    andi $a0,$s0,0xffff
    move $a3,$v0
    andi $a1,$v1,0xffff
.Lloop:
    sll $v0,$a1,1
    addu $v0,$v0,$a2
    lhu $v0,0($v0)
    beq $v0,$a0,.Lreturn_arg
     addiu $v1,$v1,1
    andi $v0,$v1,0xffff
    sltu $v0,$v0,$a3
    bnezl $v0,.Lloop
     andi $a1,$v1,0xffff
.Lnot_found:
    move $v0,$zero
.Lreturn:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end frame_identifier_find
