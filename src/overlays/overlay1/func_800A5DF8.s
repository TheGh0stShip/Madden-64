.text
.align 2
.set noreorder
.globl func_800A5DF8
.ent func_800A5DF8
func_800A5DF8:
    beqz        $v0, .L800A5EE8
    addiu       $v0, $zero, 0x2
    lw          $a0, 0x24($s0)
    sw          $v0, 0x9C($s0)
    lw          $v0, 0x14($a0)
    lui         $v1, 0xFFFB
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lhu         $v0, 0x28($s0)
    lui         $a0, 0x8009
    lw          $a0, -0x791C($a0)
    ori         $v0, $v0, 0x20
    sh          $v0, 0x28($s0)
    lw          $v0, 0x14($a0)
    ori         $v0, $v0, 0x31
    sw          $v0, 0x14($a0)
    lbu         $v1, 0x1F($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x715C($at)
    lw          $v0, 0x1C($v0)
    sw          $v0, 0x1C($a0)
    lbu         $v1, 0x1F($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x715C($at)
    lui         $a2, 0x8008
    lw          $a2, 0xC10($a2)
    ori         $a1, $zero, 0x8000
    lw          $v1, 0x20($v0)
    andi        $a2, $a2, 0x4000
    lui         $v0, 0x10
    sw          $v0, 0x24($a0)
    addiu       $v0, $zero, -0x8000
    sw          $a1, 0x2C($a0)
    sw          $v0, 0x30($a0)
    sw          $a1, 0x34($a0)
    addiu       $v1, $v1, -0x1
    beqz        $a2, .L800A5EE8
    sw          $v1, 0x20($a0)
    lui         $v0, 0x8008
    lh          $v0, 0x57F0($v0)
    bnez        $v0, .L800A5EE8
    addiu       $a0, $zero, 0x2
    sw          $zero, 0x10($sp)
    addiu       $a1, $zero, 0x12
    addu        $a2, $zero, $zero
    jal         func_800B7DD8
    addu        $a3, $zero, $zero
.L800A5EE8:
    lw          $v1, 0x9C($s0)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800A5F10
    nop
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a0, 0x8009
    lw          $a0, -0x791C($a0)
    jal         func_800B8C90
    nop
.L800A5F10:
    lui         $v0, 0x8009
    lw          $v0, -0x791C($v0)
    lw          $v0, 0x24($v0)
    beqz        $v0, .L800A5F48
    addu        $a0, $s0, $zero
    j           func_800A1830
    addu        $v0, $zero, $zero
    lw          $v0, 0x24($s0)
    lw          $v0, 0x14($v0)
    lui         $v1, 0x2
    and         $v0, $v0, $v1
    bnez        $v0, .L800A5F54
    addu        $v0, $zero, $zero
    addu        $a0, $s0, $zero
.L800A5F48:
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x41
    addiu       $v0, $zero, 0x1
.L800A5F54:
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A5DF8
