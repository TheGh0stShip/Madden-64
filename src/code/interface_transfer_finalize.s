.text
.align 2
.set noreorder
.globl interface_transfer_finalize
.ent interface_transfer_finalize
interface_transfer_finalize:
    lui $v1,%hi(D_8006B9D8)
    lhu $v1,%lo(D_8006B9D8)($v1)
    addiu $sp,$sp,-0x18
    beqz $v1,.Lstate
     sw $ra,0x10($sp)
    addiu $v0,$zero,4
    beq $v1,$v0,.Lstore_state
     addiu $v0,$zero,3
    lui $a1,%hi(D_8006B9DC)
    lw $a1,%lo(D_8006B9DC)($a1)
    lui $a0,%hi(D_8000105C)
    addiu $a0,$a0,%lo(D_8000105C)
    jal func_800E2190
     addiu $a2,$zero,1
    lui $a1,%hi(D_8006B9DC)
    lw $a1,%lo(D_8006B9DC)($a1)
    jal func_80032F3C
     move $a0,$zero
    lui $v0,%hi(D_8006B9D8)
    lhu $v0,%lo(D_8006B9D8)($v0)
    lui $at,%hi(D_8006B9DC)
    sw $zero,%lo(D_8006B9DC)($at)
    lui $at,%hi(D_8006B9DA)
    sh $v0,%lo(D_8006B9DA)($at)
.Lstate:
    addiu $v0,$zero,3
.Lstore_state:
    lui $at,%hi(D_8006B9D8)
    sh $v0,%lo(D_8006B9D8)($at)
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end interface_transfer_finalize
