.text
.align 2
.set noreorder
.globl func_800AB194
.ent func_800AB194
func_800AB194:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a2, $zero
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800AB1CC
    sw          $ra, 0x1C($sp)
    jal         func_800BC5C8
    nop
.L800AB1CC:
    lw          $v1, 0x98($s0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800AB24C
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800AB1F4
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L800AB204
    nop
    j           func_800A6C2C
    nop
.L800AB1F4:
    beq         $v1, $v0, . + 4 + (0x2B << 2)
    nop
    j           func_800A6C2C
    nop
.L800AB204:
    lh          $a0, 0x9E($s0)
    jal         func_80030B54
    nop
    andi        $v0, $v0, 0x2020
    beql        $v0, $zero, .L800AB29C
    addiu       $v0, $zero, 0x2
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    andi        $v0, $s1, 0xFFFF
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0xA0($s0)
    subu        $v0, $v0, $v1
    andi        $v1, $s2, 0xFFFF
    negu        $v1, $v1
    sw          $v0, 0xA0($s0)
    j           func_800A6B68
    slt         $v0, $v0, $v1
.L800AB24C:
    lh          $a0, 0x9E($s0)
    jal         func_80030B54
    nop
    andi        $v0, $v0, 0x10
    beqz        $v0, .L800AB29C
    addiu       $v0, $zero, 0x2
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    andi        $v0, $s1, 0xFFFF
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0xA0($s0)
    addu        $v0, $v0, $v1
    andi        $v1, $s2, 0xFFFF
    sw          $v0, 0xA0($s0)
    slt         $v0, $v1, $v0
    bnel        $v0, $zero, . + 4 + (0x30 << 2)
    sw          $v1, 0xA0($s0)
    j           func_800A6C2C
    nop
.L800AB29C:
    j           func_800A6C2C
    sw          $v0, 0x98($s0)
.end func_800AB194
