.text
.align 2
.set noreorder
.globl memory_block_insert
.ent memory_block_insert
memory_block_insert:
    sll $v0,$a1,16
    lui $v1,0x8008
    addiu $v1,$v1,-0x5bf4
    sra $a2,$v0,14
    addu $a3,$a2,$v1
    lw $v1,0($a3)
    addiu $v0,$zero,-1
    bnel $v1,$v0,.Lsearch_setup
     addiu $a3,$zero,-1
    lui $at,0x8008
    addu $at,$at,$a2
    sw $a0,-0x5bf0($at)
    sw $a0,0($a3)
    sw $v1,0x18($a0)
    j .Ldone
     sw $v1,0x14($a0)
.Lsearch_setup:
    lw $a2,4($a0)
.Lsearch:
    lw $v0,4($v1)
    sltu $v0,$v0,$a2
    beql $v0,$zero,.Lafter_search
     addiu $a2,$zero,-1
    lw $v1,0x14($v1)
    bne $v1,$a3,.Lsearch
     nop
.Lsearch_done:
    addiu $a2,$zero,-1
.Lafter_search:
    bne $v1,$a2,.Lmiddle
     sll $v0,$a1,16
    lui $v1,0x8008
    addiu $v1,$v1,-0x5bf0
    sra $v0,$v0,14
    addu $v0,$v0,$v1
    lw $v1,0($v0)
    sw $a0,0x14($v1)
    sw $v1,0x18($a0)
    sw $a2,0x14($a0)
    j .Ldone
     sw $a0,0($v0)
.Lmiddle:
    lw $v0,0x18($v1)
    bnel $v0,$a2,.Lnormal
     sw $a0,0x14($v0)
    sw $a0,0x18($v1)
    sw $v0,0x18($a0)
    sll $v0,$a1,16
    sra $v0,$v0,14
    sw $v1,0x14($a0)
    lui $at,0x8008
    addu $at,$at,$v0
    sw $a0,-0x5bf4($at)
    j .Ldone
     nop
.Lnormal:
    sw $v0,0x18($a0)
    sw $v1,0x14($a0)
    sw $a0,0x18($v1)
.Ldone:
    jr $ra
     nop
.end memory_block_insert
