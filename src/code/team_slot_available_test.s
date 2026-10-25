.text
.align 2
.set noreorder
.globl team_slot_available_test
.ent team_slot_available_test
team_slot_available_test:
    move $a2,$zero
    sll $a0,$a0,16
    sra $a0,$a0,16
    sll $v0,$a0,5
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    addu $v0,$v0,$a0
    sll $v0,$v0,2
    subu $v0,$v0,$a0
    sll $v0,$v0,2
    move $a0,$v0
    sll $a1,$a1,16
    lui $v0,0x8008
    addiu $v0,$v0,0xcfc
    sra $a1,$a1,15
    addu $v0,$a0,$v0
    addu $a1,$a1,$v0
    lhu $a1,0($a1)
    addiu $a3,$zero,0x80
    addiu $t0,$zero,-1
.Lloop:
    sll $v0,$a2,16
.Lrepeat:
    sra $v0,$v0,14
    addu $v1,$v0,$a0
    lui $at,0x8008
    addu $at,$at,$v1
    lhu $v0,0x2d84($at)
    bne $a1,$v0,.Lnext
     addiu $v0,$a2,1
    lui $at,0x8008
    addu $at,$at,$v1
    lbu $v0,0x2d87($at)
    beq $v0,$a3,.Lreturn
     addiu $v0,$zero,1
    lui $at,0x8008
    addu $at,$at,$v1
    lbu $v0,0x2d86($at)
    sll $v0,$v0,3
    lui $at,0x8007
    addu $at,$at,$v0
    lb $v0,0x3e29($at)
    bne $v0,$t0,.Lyes
     move $v0,$zero
    j .Lreturn
     nop
.Lnext:
    move $a2,$v0
.Lnext_zero:
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,4
    bnez $v0,.Lrepeat
     sll $v0,$a2,16
.Lyes:
    addiu $v0,$zero,1
.Lreturn:
    jr $ra
     nop
.end team_slot_available_test
