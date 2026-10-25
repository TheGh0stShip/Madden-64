.text
.align 2
.set noreorder
.globl resource_node_unlink
.ent resource_node_unlink
resource_node_unlink:
    addiu $sp,$sp,-0x18
    move $a3,$a0
    sw $ra,0x10($sp)
    lw $a2,0x10($a3)
    lw $a0,0xc($a3)
    addiu $v0,$zero,-1
    beq $a2,$v0,.Lhead
     move $v1,$a1
    j .Llinked
     sw $a0,0xc($a2)
.Lhead:
    sll $v0,$a1,16
    sra $v0,$v0,14
    lui $at,0x8008
    addu $at,$at,$v0
    sw $a0,-0x5bec($at)
    addiu $v0,$zero,-1
.Llinked:
    bnel $a0,$v0,.Lnext
     sw $a2,0x10($a0)
.Lnext:
    sll $v1,$v1,16
    sra $v1,$v1,14
    lui $at,0x8008
    addu $at,$at,$v1
    lw $v0,-0x5c00($at)
    lui $a0,0x2492
    ori $a0,$a0,0x4925
    subu $v0,$a3,$v0
    srl $v0,$v0,2
    multu $v0,$a0
    lui $v0,0x8008
    addiu $v0,$v0,-0x5bf8
    addu $v1,$v1,$v0
    lw $v0,0($v1)
    move $a0,$a3
    addiu $v0,$v0,2
    mfhi $t0
    sh $t0,0($v0)
    jal func_80033534
     sw $v0,0($v1)
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end resource_node_unlink
