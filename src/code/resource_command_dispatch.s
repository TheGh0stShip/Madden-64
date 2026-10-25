.text
.align 2
.set noreorder
.set nomacro
.globl resource_command_dispatch
.ent resource_command_dispatch
resource_command_dispatch:
    addiu $sp,$sp,-0x20
    lw $t0,0x30($sp)
    lw $v1,0x34($sp)
    andi $a1,$a1,0xffff
    addiu $a1,$a1,-7
    sltiu $v0,$a1,0xc
    beqz $v0,.Ldone
     sw $ra,0x18($sp)
    sll $v0,$a1,2
    lui $at,0x8000
    addu $at,$at,$v0
    lw $v0,0xa00($at)
    jr $v0
     nop
.Lcase0:
    sw $v1,0x10($sp)
    andi $a1,$a2,0xffff
    andi $a2,$a3,0xffff
    jal func_80019B10
     move $a3,$t0
    j .Ldone
     nop
.Lcase1:
    sw $v1,0x10($sp)
    andi $a1,$a2,0xffff
    andi $a2,$a3,0xffff
    jal func_80019DD0
     move $a3,$t0
    j .Ldone
     nop
.Lcase2:
    andi $v0,$a2,0xffff
    andi $a2,$a3,0xffff
    mult $v0,$a2
    mflo $a2
    move $a0,$v1
    jal func_8002E58C
     move $a1,$zero
    j .Ldone
     nop
.Lcase3:
    sw $v1,0x10($sp)
    andi $a1,$a2,0xffff
    andi $a2,$a3,0xffff
    jal func_80019FD4
     move $a3,$t0
    j .Ldone
.Lcase4:
     mult $a2,$a3
    mflo $a2
    move $a1,$v1
    addiu $a3,$zero,2
    jal func_80019868
     andi $a2,$a2,0xffff
.Ldone:
    lw $ra,0x18($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end resource_command_dispatch
