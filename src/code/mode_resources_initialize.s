.text
.align 2
.set noreorder
.globl mode_resources_initialize
.ent mode_resources_initialize
mode_resources_initialize:
    addiu $sp,$sp,-0x18
    lui $a0,%hi(D_80001190)
    addiu $a0,$a0,%lo(D_80001190)
    sw $ra,0x10($sp)
    jal func_800E2124
     move $a1,$zero
    move $a0,$zero
    lui $v1,%hi(D_80088118)
    addiu $v1,$v1,%lo(D_80088118)
    addiu $a2,$zero,-1
    addiu $a1,$zero,1
    lui $at,%hi(D_800895B8)
    sw $v0,%lo(D_800895B8)($at)
    lui $at,%hi(D_800885E4)
    sw $v1,%lo(D_800885E4)($at)
    lui $at,%hi(D_8006BA22)
    sh $zero,%lo(D_8006BA22)($at)
    sll $v0,$a0,16
.Lloop:
    sra $v0,$v0,15
    addu $v0,$v0,$v1
    lh $v0,0x88($v0)
    beq $v0,$a2,.Lnext
     addiu $v0,$a0,1
    lui $at,%hi(D_8006BA22)
    sh $a1,%lo(D_8006BA22)($at)
.Lnext:
    move $a0,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,8
    bnez $v0,.Lloop
     sll $v0,$a0,16
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end mode_resources_initialize
