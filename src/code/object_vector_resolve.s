.text
.align 2
.set noreorder
.globl object_vector_resolve
.ent object_vector_resolve
object_vector_resolve:
    beqz $a3,.Lpositive
     negu $a2,$a2
    lw $v0,0x1c($a0)
    lui $v1,4
    ori $v1,$v1,0xcccc
    negu $v0,$v0
    sra $t6,$v0,8
    sra $t7,$v1,8
    mult $t6,$t7
    mflo $v1
    nop
    nop
    sw $v1,0($a1)
    lw $v0,0x20($a0)
    lui $t0,4
    ori $t0,$t0,0xcccc
    negu $v0,$v0
    sra $t6,$v0,8
    sra $t7,$t0,8
    mult $t6,$t7
    mflo $t0
    nop
    nop
    j .Lthird
     sw $t0,4($a1)
.Lpositive:
    lw $v1,0x1c($a0)
    lui $t0,4
    ori $t0,$t0,0xcccc
    sra $t6,$v1,8
    sra $t7,$t0,8
    mult $t6,$t7
    mflo $t0
    nop
    nop
    sw $t0,0($a1)
    lui $t0,4
    ori $t0,$t0,0xcccc
    lw $v1,0x20($a0)
    sra $t6,$v1,8
    sra $t7,$t0,8
    mult $t6,$t7
    mflo $t0
    nop
    nop
    addiu $a2,$a2,-0x800
    sw $t0,4($a1)
.Lthird:
    lui $v1,4
    ori $v1,$v1,0xcccc
    lw $a0,0x24($a0)
    sra $t6,$a0,8
    sra $t7,$v1,8
    mult $t6,$t7
    mflo $v1
    nop
    nop
    andi $v0,$a2,0xfff
    jr $ra
     sw $v1,8($a1)
.end object_vector_resolve
