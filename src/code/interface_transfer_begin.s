.text
.align 2
.set noreorder
.globl interface_transfer_begin
.ent interface_transfer_begin
interface_transfer_begin:
    addiu $sp,$sp,-0x18
    lui $at,%hi(D_8006B9D8)
    sh $a0,%lo(D_8006B9D8)($at)
    andi $a0,$a0,0xffff
    beqz $a0,.Lmode_zero
     sw $ra,0x10($sp)
    addiu $v0,$zero,4
    bne $a0,$v0,.Lallocate
     move $a0,$zero
    j .Ldone
     nop
.Lmode_zero:
    jal func_8002619C
     nop
    j .Ldone
     nop
.Lallocate:
    jal func_80032E00
     addiu $a1,$zero,0x5c08
    lui $a0,%hi(D_8000105C)
    addiu $a0,$a0,%lo(D_8000105C)
    move $a1,$v0
    lui $at,%hi(D_8006B9DC)
    sw $a1,%lo(D_8006B9DC)($at)
    jal func_800E2068
     addiu $a2,$zero,1
    lui $at,%hi(D_800855D4)
    sh $zero,%lo(D_800855D4)($at)
    jal func_8002506C
     nop
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end interface_transfer_begin
