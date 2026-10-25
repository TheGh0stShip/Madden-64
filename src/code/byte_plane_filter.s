.text
.align 2
.set noreorder
.globl byte_plane_filter
.ent byte_plane_filter
byte_plane_filter:
    addiu $sp,$sp,-8
    move $t4,$a0
    lw $v0,0x134($t4)
    lw $a3,0($a3)
    blez $v0,.Ldone
     move $t3,$zero
.Lrow:
    lw $t1,0($a2)
    lw $t0,0($a3)
    lbu $a0,0($t1)
    addiu $t1,$t1,1
    sb $a0,0($t0)
    addiu $t0,$t0,1
    lbu $v0,0($t1)
    sll $v1,$a0,1
    addu $v1,$v1,$a0
    addu $v1,$v1,$v0
    addiu $v1,$v1,2
    srl $v1,$v1,2
    sb $v1,0($t0)
    lw $v0,0x28($a1)
    addiu $t2,$v0,-2
    beqz $t2,.Ledge
     addiu $t0,$t0,1
.Linner:
    lbu $a0,0($t1)
    addiu $t1,$t1,1
    lbu $v0,-2($t1)
    sll $v1,$a0,1
    addu $a0,$v1,$a0
    addu $v0,$a0,$v0
    addiu $v0,$v0,1
    srl $v0,$v0,2
    sb $v0,0($t0)
    lbu $v0,0($t1)
    addiu $t2,$t2,-1
    addiu $t0,$t0,1
    addu $v0,$a0,$v0
    addiu $v0,$v0,2
    srl $v0,$v0,2
    sb $v0,0($t0)
    bnez $t2,.Linner
     addiu $t0,$t0,1
.Ledge:
    lbu $a0,0($t1)
    addiu $a3,$a3,4
    lbu $v0,-1($t1)
    sll $v1,$a0,1
    addu $v1,$v1,$a0
    addu $v1,$v1,$v0
    addiu $v1,$v1,1
    srl $v1,$v1,2
    sb $v1,0($t0)
    sb $a0,1($t0)
    lw $v0,0x134($t4)
    addiu $t3,$t3,1
    slt $v0,$t3,$v0
    bnez $v0,.Lrow
     addiu $a2,$a2,4
.Ldone:
    addiu $sp,$sp,8
    jr $ra
     nop
.end byte_plane_filter
