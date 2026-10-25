.text
.align 2
.set noreorder
.globl frame_resource_prepare
.ent frame_resource_prepare
frame_resource_prepare:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x1C($sp)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80027CD4
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8009
    lh          $s0, -0x7920($s0)
    j .L80027CE0
    sll         $v0, $s0, 5
.L80027CD4:
    lui         $s0, 0x8009
    lh          $s0, -0x751C($s0)
    sll         $v0, $s0, 5
.L80027CE0:
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x2DBC($at)
    lbu         $v0, 0x0($v0)
    andi        $v1, $v0, 0x60
    addiu       $v0, $zero, 0x20
    bne         $v1, $v0, .L80027D2C
    addiu       $v0, $zero, 0x40
    andi        $a0, $s0, 0xFFFF
    j .L80027D38
    addiu       $a1, $zero, 0x16
.L80027D2C:
    bne         $v1, $v0, .L80027D40
    andi        $a0, $s0, 0xFFFF
    addiu       $a1, $zero, 0x15
.L80027D38:
    jal         func_80025944
    addiu       $a2, $zero, 0x1
.L80027D40:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L80027D98
    addiu       $v0, $zero, 0x4
    andi        $s0, $s0, 0xFFFF
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x4
    jal         func_80025944
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    bnez        $v0, .L80027E1C
    andi        $v0, $s1, 0x4
    bnez        $v0, .L80027E1C
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L80027E1C
    addu        $a0, $s0, $zero
    j .L80027E14
    addiu       $a1, $zero, 0x5
.L80027D98:
    bne         $v1, $v0, .L80027E1C
    nop
    lui         $v1, 0x8007
    lhu         $v1, -0x4856($v1)
    addiu       $v0, $v1, -0x15
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L80027E1C
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    xori        $v1, $v0, 0x17
    sltu        $v1, $zero, $v1
    xori        $v0, $v0, 0x12
    sltu        $v0, $zero, $v0
    and         $v1, $v1, $v0
    beqz        $v1, .L80027E1C
    andi        $s0, $s0, 0xFFFF
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x6
    jal         func_80025944
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    bnez        $v0, .L80027E1C
    andi        $v0, $s1, 0x4
    bnez        $v0, .L80027E1C
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L80027E1C
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x7
.L80027E14:
    jal         func_80025944
    addiu       $a2, $zero, 0x1
.L80027E1C:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end frame_resource_prepare
