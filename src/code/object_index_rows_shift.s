.text
.align 2
.set noreorder
.globl object_index_rows_shift
.ent object_index_rows_shift
object_index_rows_shift:
    lw $v1,8($a0)
    lw $v0,4($v1)
    lhu $v0,4($v0)
    andi $v0,$v0,8
    beqz $v0,.Ldone
     nop
    lw $t2,0xc($v1)
    andi $a3,$a3,0xff
    beqz $a3,.Ldone
     move $t1,$zero
    andi $v0,$a1,0xff
    sll $v1,$v0,1
    addu $t5,$v1,$t2
    andi $a2,$a2,0xff
    sltu $t4,$v0,$a2
    sll $v0,$a2,1
    addu $t3,$v0,$t2
.Lrow:
    lhu $t0,0($t5)
    beqz $t4,.Lrow_done
     move $a0,$a1
    andi $v0,$a0,0xff
.Lshift:
    sll $v0,$v0,1
    addu $v0,$v0,$t2
    lhu $v1,2($v0)
    addiu $a0,$a0,1
    sh $v1,0($v0)
    andi $v0,$a0,0xff
    sltu $v0,$v0,$a2
    bnez $v0,.Lshift
     andi $v0,$a0,0xff
.Lrow_done:
    addiu $t1,$t1,1
    andi $v0,$t1,0xff
    sltu $v0,$v0,$a3
    bnez $v0,.Lrow
     sh $t0,0($t3)
.Ldone:
    jr $ra
     nop
.end object_index_rows_shift
