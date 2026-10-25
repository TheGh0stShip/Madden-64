.text
.align 2
.set noreorder
.globl team_stat_value_get
.ent team_stat_value_get
team_stat_value_get:
    addiu $sp,$sp,-0x18
    andi $a0,$a0,0xffff
    sll $v0,$a0,5
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    subu $v0,$v0,$a0
    sll $t0,$v0,2
    andi $a1,$a1,0xffff
    lui $t1,0x8008
    addiu $t1,$t1,0xcfc
    sll $v1,$a1,1
    addu $v0,$t0,$t1
    addu $v0,$v1,$v0
    sw $ra,0x10($sp)
    lhu $a0,0($v0)
    ori $v0,$zero,0xffff
    bne $a0,$v0,.Lvalid
     move $a3,$a2
    j .Ldone
     addiu $v0,$zero,-0x8000
.Lvalid:
    lui $v0,0x8007
    lhu $v0,-0x4628($v0)
    bnez $v0,.Lfallback
     addiu $v0,$a2,-0x21
    addiu $v0,$t1,0xb7a
    addu $v1,$v1,$a1
    sll $v1,$v1,4
    subu $v1,$v1,$a1
    sll $v1,$v1,1
    addu $v0,$t0,$v0
    addu $v1,$v1,$v0
    andi $v0,$a3,0xffff
    sll $v0,$v0,1
    addu $v0,$v0,$v1
    lh $v0,0($v0)
    j .Ldone
     nop
.Lfallback:
    andi $v0,$v0,0xffff
    sltiu $v0,$v0,6
    bnez $v0,.Lalternate
     nop
    jal func_80023F94
     andi $a1,$a3,0xffff
    j .Lsign
     sll $v0,$v0,16
.Lalternate:
    jal func_8002836C
     andi $a1,$a3,0xffff
    sll $v0,$v0,16
.Lsign:
    sra $v0,$v0,16
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end team_stat_value_get
