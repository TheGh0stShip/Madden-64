.text
.align 2
.set noreorder
.globl mode_resource_update
.ent mode_resource_update
mode_resource_update:
    addiu       $sp, $sp, -0x50
    lw          $v1, 0x60($sp)
    lui         $v0, 0x8007
    lh          $v0, -0x45DE($v0)
    sw          $s2, 0x30($sp)
    addu        $s2, $a0, $zero
    sw          $s6, 0x40($sp)
    addu        $s6, $a1, $zero
    sw          $s0, 0x28($sp)
    addu        $s0, $a2, $zero
    sw          $s7, 0x44($sp)
    addu        $s7, $a3, $zero
    sw          $ra, 0x48($sp)
    sw          $s5, 0x3C($sp)
    sw          $s4, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s1, 0x2C($sp)
    beqz        $v0, .L80028F04
    addu        $s4, $v1, $zero
    andi        $v0, $v1, 0xC0
    bnez        $v0, .L80028D34
    addu        $s1, $zero, $zero
    jal         func_800DD6EC
    nop
    lui         $v1, 0x8009
    lhu         $v1, -0x751C($v1)
    andi        $v0, $s0, 0xFFFF
    bne         $v0, $v1, .L80028D2C
    nop
    lui         $s4, 0x8008
    lhu         $s4, 0x57B2($s4)
    j .L80028D38
    andi        $v1, $s4, 0xC0
.L80028D2C:
    lui         $s4, 0x8008
    lhu         $s4, 0x5280($s4)
.L80028D34:
    andi        $v1, $s4, 0xC0
.L80028D38:
    addiu       $v0, $zero, 0x40
    bne         $v1, $v0, .L80028D94
    andi        $v1, $s4, 0xFF3F
    addu        $s1, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7A1C($a0)
    sll         $v0, $s1, 16
.L80028D54:
    sra         $v0, $v0, 15
    addu        $v0, $v0, $a0
    lh          $v0, 0x88($v0)
    beq         $v0, $v1, .L80028D80
    addiu       $v0, $s1, 0x1
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnez        $v0, .L80028D54
    sll         $v0, $s1, 16
.L80028D80:
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x8
    beq         $v0, $v1, .L80028F04
    nop
.L80028D94:
    lui         $v1, 0x8009
    lw          $v1, -0x6A48($v1)
    sll         $v0, $s2, 16
    sra         $s3, $v0, 16
    sll         $s5, $s3, 1
    addu        $a0, $s5, $v1
    lh          $v1, 0xEE($a0)
    sll         $v0, $s6, 16
    sra         $v0, $v0, 16
    slt         $v1, $v1, $v0
    beqz        $v1, .L80028F04
    andi        $s0, $s0, 0xFFFF
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x30D8
    sw          $v0, 0x10($sp)
    sll         $v0, $s3, 16
    addu        $v0, $s0, $v0
    sw          $v0, 0x14($sp)
    lh          $v0, 0xEE($a0)
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x14
    jal         func_80032E00
    sw          $v0, 0x18($sp)
    addiu       $a0, $sp, 0x10
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0xAF
    jal         func_800AE924
    sh          $v0, 0x20($sp)
    lw          $a0, 0x1C($sp)
    lui         $a1, 0x8009
    lw          $a1, -0x6A48($a1)
    sll         $v0, $s3, 4
    addu        $s2, $v0, $s3
    jal         func_8002E65C
    addu        $a1, $a1, $s2
    lui         $a1, 0x8009
    lw          $a1, -0x6A48($a1)
    sll         $v0, $s0, 5
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    andi        $a0, $s7, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    sll         $a0, $a0, 1
    addu        $v1, $v0, $v1
    addu        $a0, $a0, $v1
    addu        $a2, $s5, $a1
    sh          $s6, 0xEE($a2)
    lhu         $v1, 0x0($a0)
    sh          $v1, 0x10A($a2)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xC90($at)
    addu        $a1, $a1, $s3
    andi        $v1, $s4, 0xC0
    sb          $v0, 0x126($a1)
    addiu       $v0, $zero, 0x40
    bne         $v1, $v0, .L80028ED0
    sll         $v0, $s1, 16
    lui         $a0, 0x8009
    lw          $a0, -0x6A48($a0)
    sra         $v0, $v0, 16
    sll         $a1, $v0, 1
    addu        $a1, $a1, $v0
    lui         $v1, 0x8009
    lw          $v1, -0x7A1C($v1)
    sll         $a1, $a1, 2
    subu        $a1, $a1, $v0
    addu        $a0, $a0, $s2
    jal         func_8002E65C
    addu        $a1, $v1, $a1
    j .L80028EF4
    nop
.L80028ED0:
    lui         $v0, 0x8009
    lw          $v0, -0x6A48($v0)
    addu        $v0, $s2, $v0
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0x1198
    lwl         $v1, 0x0($a2)
    lwr         $v1, 0x3($a2)
    swl         $v1, 0x0($v0)
    swr         $v1, 0x3($v0)
.L80028EF4:
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x1190
    jal         func_800370B0
    addu        $a1, $zero, $zero
.L80028F04:
    lw          $ra, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end mode_resource_update
