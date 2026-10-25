.text
.align 2
.set noreorder
.globl rgb5551_pack_many
.ent rgb5551_pack_many
rgb5551_pack_many:
    move $t0,$a0
    move $t1,$a1
    sll $a2,$a2,16
    sra $a2,$a2,16
    move $v0,$a2
    beqz $v0,.Ldone
     addiu $a2,$a2,-1
    addiu $a3,$a1,2
.Lloop:
    lbu $v0,0($t1)
    lbu $v1,-1($a3)
    lbu $a0,0($a3)
    addiu $a3,$a3,3
    addiu $t1,$t1,3
    move $a1,$a2
    addiu $a2,$a2,-1
    srl $v0,$v0,3
    srl $v1,$v1,3
    srl $a0,$a0,3
    sll $v0,$v0,11
    sll $v1,$v1,6
    or $v0,$v0,$v1
    sll $a0,$a0,1
    or $v0,$v0,$a0
    ori $v0,$v0,1
    sh $v0,0($t0)
    bnez $a1,.Lloop
     addiu $t0,$t0,2
.Ldone:
    jr $ra
     nop
.end rgb5551_pack_many
