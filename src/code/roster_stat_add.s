.text
.align 2
.set noreorder
.globl roster_stat_add
.ent roster_stat_add
roster_stat_add:
    lui $v0,%hi(D_80089320)
    lh $v0,%lo(D_80089320)($v0)
    bnel $v0,$zero,.Lrange_23_26
     andi $a1,$a1,0xffff
    andi $a3,$a1,0xffff
    slti $v0,$a3,8
    bnez $v0,.Lreturn
     slti $v0,$a3,10
    bnel $v0,$zero,.Lrange_23_26
     andi $a1,$a1,0xffff
    slti $v0,$a3,15
    beqz $v0,.Lreturn
     slti $v0,$a3,13
    bnez $v0,.Lreturn
     andi $a1,$a1,0xffff
.Lrange_23_26:
    slti $v0,$a1,27
    beqz $v0,.Lupdate
     slti $v0,$a1,23
    beqz $v0,.Lreturn
     nop
.Lupdate:
    andi $v1,$a0,0xffff
    sll $v0,$v1,5
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    subu $v0,$v0,$v1
    sll $v0,$v0,2
    lui $a0,%hi(D_80082D50)
    addiu $a0,$a0,%lo(D_80082D50)
    sll $v1,$a1,1
    addu $v0,$v0,$a0
    addu $v1,$v1,$v0
    lhu $v0,0($v1)
    addu $v0,$v0,$a2
    sh $v0,0($v1)
.Lreturn:
    jr $ra
     nop
.end roster_stat_add
