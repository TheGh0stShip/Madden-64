.text
.align 2
.set noreorder
.globl resource_bytes_copy
.ent resource_bytes_copy
resource_bytes_copy:
    lw $t0,0($a0)
    addiu $v0,$zero,1
    beq $a3,$v0,.Lfour
     nop
    bnez $a3,.Lvariable
     andi $t1,$a2,0xffff
    lw $v0,8($a0)
    addu $v0,$t0,$v0
    lbu $v0,1($v0)
    sb $v0,0($a1)
    lw $v0,8($a0)
    addu $v0,$t0,$v0
    lbu $v0,0($v0)
    sb $v0,1($a1)
    lw $v0,8($a0)
    j .Lstore_offset
     addiu $v0,$v0,2
.Lfour:
    lw $v0,8($a0)
    addu $v0,$t0,$v0
    lbu $v0,3($v0)
    sb $v0,0($a1)
    lw $v0,8($a0)
    addu $v0,$t0,$v0
    lbu $v0,2($v0)
    sb $v0,1($a1)
    lw $v0,8($a0)
    addu $v0,$t0,$v0
    lbu $v0,1($v0)
    sb $v0,2($a1)
    lw $v0,8($a0)
    addu $v0,$t0,$v0
    lbu $v0,0($v0)
    sb $v0,3($a1)
    lw $v0,8($a0)
    j .Lstore_offset
     addiu $v0,$v0,4
.Lvariable:
    beqz $t1,.Ladvance
     move $a3,$zero
.Lcopy:
    lw $v0,8($a0)
    andi $v1,$a3,0xffff
    addu $v0,$t0,$v0
    addu $v0,$v0,$v1
    lbu $v0,0($v0)
    addiu $a3,$a3,1
    addu $v1,$a1,$v1
    sb $v0,0($v1)
    andi $v0,$a3,0xffff
    sltu $v0,$v0,$t1
    bnez $v0,.Lcopy
     nop
.Ladvance:
    lw $v0,8($a0)
    andi $v1,$a2,0xffff
    addu $v0,$v0,$v1
.Lstore_offset:
    jr $ra
     sw $v0,8($a0)
.end resource_bytes_copy
