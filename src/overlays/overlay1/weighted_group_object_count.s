.text
.align 2
.set noreorder
.globl weighted_group_object_count
.ent weighted_group_object_count
weighted_group_object_count:
    lui $v0,%hi(D_8008B672)
    lhu $v0,%lo(D_8008B672)($v0)
    addu $a2,$zero,$zero
    srl $v1,$v0,1
    beqz $v1,.Lreturn
     addu $a3,$zero,$zero
    addiu $t0,$zero,0x27
    addiu $t3,$zero,3
    lui $t2,2
    lui $v0,%hi(D_80088AE4)
    lh $v0,%lo(D_80088AE4)($v0)
    addu $t1,$v1,$zero
    lui $a0,%hi(D_80085040)
    addiu $a0,$a0,%lo(D_80085040)
    sll $v1,$v0,1
    addu $v1,$v1,$v0
    sll $v1,$v1,2
    subu $v1,$v1,$v0
    sll $v1,$v1,3
    addu $v1,$v1,$a0
    sll $v0,$a3,16
.Lloop:
    sra $v0,$v0,14
    addu $v0,$v0,$v1
    lw $a0,0($v0)
    lbu $v0,0x1f($a0)
    bnez $v0,.Lclassify
     nop
    lbu $v0,0x20($a0)
    bnez $v0,.Lclassify
     nop
    lbu $v0,0x64($a0)
    beql $v0,$zero,.Ladvance
     addiu $v0,$a3,1
    bnel $v0,$t0,.Lstore_count
     addiu $a2,$a2,2
    j func_8008F4E0
     addiu $v0,$a3,1
.Lclassify:
    lbu $a1,0x64($a0)
    beql $a1,$t3,.Lflags
     addiu $a2,$a2,2
.Lflags:
    lw $v0,0x24($a0)
    lw $v0,0x14($v0)
    and $v0,$v0,$t2
    bnel $v0,$zero,.Lstore_count
     addiu $a2,$a2,1
    beqz $a1,.Ladvance
     addiu $v0,$a3,1
    beql $a1,$t0,.Ltest_limit
     addu $a3,$v0,$zero
    addiu $a2,$a2,1
.Lstore_count:
    addiu $v0,$a3,1
.Ladvance:
    addu $a3,$v0,$zero
.Ltest_limit:
    sll $v0,$v0,16
    sra $v0,$v0,16
    slt $v0,$v0,$t1
    bnel $v0,$zero,.Lloop
     sll $v0,$a3,16
.Lreturn:
    sll $v0,$a2,16
    jr $ra
     sra $v0,$v0,16
.end weighted_group_object_count
