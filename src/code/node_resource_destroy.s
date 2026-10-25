.text
.align 2
.set noreorder
.globl node_resource_destroy
.ent node_resource_destroy
node_resource_destroy:
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    sw $ra,0x14($sp)
    jal func_8000BE80
     addu $s0,$a0,$zero
    lhu $a0,0x54($s0)
    lui $v1,%hi(D_800782FC)
    lw $v1,%lo(D_800782FC)($v1)
    sll $v0,$a0,1
    addu $v0,$v0,$a0
    sll $v0,$v0,3
    addu $v1,$v1,$v0
    lw $v0,0x14($v1)
    jalr $v0
     addu $a0,$s0,$zero
    lhu $v0,0x54($s0)
    lui $v1,%hi(D_800782F8)
    lw $v1,%lo(D_800782F8)($v1)
    lw $a1,8($s0)
    sll $v0,$v0,2
    addu $v0,$v0,$v1
    lw $a0,0($v0)
    jal func_800332C8
     nop
    lui $a0,%hi(D_800782F4)
    lw $a0,%lo(D_800782F4)($a0)
    addu $a1,$s0,$zero
    jal func_800332C8
     sw $zero,8($a1)
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end node_resource_destroy
