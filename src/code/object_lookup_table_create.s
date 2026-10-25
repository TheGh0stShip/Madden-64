.text
.align 2
.set noreorder
.globl object_lookup_table_create
.ent object_lookup_table_create
object_lookup_table_create:
    addiu $sp,$sp,-0x18
    sw $ra,0x14($sp)
    sw $s0,0x10($sp)
    lw $v0,4($a0)
    lw $s0,0x1c8($a0)
    lw $v0,0($v0)
    addiu $a1,$zero,1
    jalr $v0
     addiu $a2,$zero,0x7fc
    move $a0,$zero
    move $v1,$zero
    addiu $a3,$v0,0x3fc
    move $a2,$a3
    move $a1,$a3
    sw $a3,0x28($s0)
.Lfirst:
    negu $v0,$a0
    sw $a0,0($a1)
    sw $v0,0($a2)
    addiu $a2,$a2,-4
    addiu $a1,$a1,4
    addiu $v1,$v1,1
    slti $v0,$v1,0x10
    bnez $v0,.Lfirst
     addiu $a0,$a0,1
    slti $v0,$v1,0x30
    beqz $v0,.Lthird_test
     sll $v0,$v1,2
    subu $a2,$a3,$v0
    addu $a1,$v0,$a3
.Lsecond:
    negu $v0,$a0
    sw $a0,0($a1)
    sw $v0,0($a2)
    addiu $a2,$a2,-4
    addiu $v1,$v1,1
    xori $v0,$v1,1
    andi $v0,$v0,1
    addu $a0,$a0,$v0
    slti $v0,$v1,0x30
    bnez $v0,.Lsecond
     addiu $a1,$a1,4
.Lthird_test:
    slti $v0,$v1,0x100
    beqz $v0,.Ldone
     negu $t0,$a0
    sll $v0,$v1,2
    subu $a2,$a3,$v0
    addu $a1,$v0,$a3
.Lthird:
    sw $a0,0($a1)
    sw $t0,0($a2)
    addiu $a2,$a2,-4
    addiu $v1,$v1,1
    slti $v0,$v1,0x100
    bnez $v0,.Lthird
     addiu $a1,$a1,4
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end object_lookup_table_create
