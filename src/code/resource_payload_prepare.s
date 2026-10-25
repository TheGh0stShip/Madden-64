.text
.align 2
.set noreorder
.globl resource_payload_prepare
.ent resource_payload_prepare
resource_payload_prepare:
    addiu $sp,$sp,-0x20
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lw $s1,8($a0)
    lw $v1,0x30($s1)
    andi $v0,$v1,8
    beqz $v0,.Lshared
     move $s0,$zero
    lhu $v1,0xc($s1)
    addiu $v0,$zero,8
    beql $v1,$v0,.Lallocate
     addiu $s0,$zero,0x100
    slti $v0,$v1,9
    beqz $v0,.Lsize_ready
     move $a0,$zero
    xori $v0,$v1,4
    sltiu $v0,$v0,1
    j .Lsize_ready
     sll $s0,$v0,4
.Lallocate:
    move $a0,$zero
.Lsize_ready:
    sll $s0,$s0,1
    jal func_80032E00
     move $a1,$s0
    lw $a1,0x20($s1)
    move $a0,$v0
    move $a2,$s0
    jal func_8002E17C
     sw $a0,8($s1)
    lw $v0,0x30($s1)
    addiu $v1,$zero,-9
    j .Lstore
     and $v0,$v0,$v1
.Lshared:
    ori $v0,$v1,0x800
.Lstore:
    sw $v0,0x30($s1)
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end resource_payload_prepare
