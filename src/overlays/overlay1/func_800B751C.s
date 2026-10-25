.text
.align 2
.set noreorder
.globl func_800B751C
.ent func_800B751C
func_800B751C:
    lui         $v1, 0x8008
    lw          $v1, -0x5DD8($v1)
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    addiu       $v0, $zero, 0x3
    sw          $ra, 0x18($sp)
    beq         $v1, $v0, .L800B76C0
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5DD4
    addiu       $a0, $s1, 0x2C
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0x4
    jal         func_800A5DF8
    addiu       $a3, $zero, 0x4
    lw          $v0, 0x2C($s1)
    lui         $a0, 0x8009
    lw          $a0, -0x4C98($a0)
    sw          $v0, 0x0($s0)
    lw          $v0, 0x30($s1)
    lui         $at, 0x8008
    sw          $v0, -0x5DD0($at)
    lw          $v0, 0x34($s1)
    lui         $at, 0x8008
    sw          $v0, -0x5DCC($at)
    beqz        $a0, .L800B75E8
    addiu       $v0, $zero, 0x1
    lui         $v0, 0x8008
    lw          $v0, -0x5DC0($v0)
    sw          $v0, 0x98($s1)
    lbu         $v1, 0x1E($a0)
    lui         $v0, 0x8008
    lw          $v0, -0x5DDC($v0)
    beq         $v0, $v1, .L800B763C
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lw          $v1, -0x5DD8($v1)
    beq         $v1, $v0, .L800B763C
    nop
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x5DE8
    lw          $v1, 0x0($v0)
    addiu       $v1, $v1, 0x800
    andi        $v1, $v1, 0xFFF
    sw          $v1, 0x0($v0)
    lbu         $v0, 0x1E($a0)
    lui         $at, 0x8008
    sw          $v0, -0x5DDC($at)
    j           func_800B2F18
    nop
.L800B75E8:
    lui         $v1, 0x8008
    lw          $v1, -0x5DD8($v1)
    beq         $v1, $v0, .L800B763C
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lui         $a0, 0x8008
    lw          $a0, -0x5DC0($a0)
    lw          $v0, 0x24($v0)
    addu        $v0, $v0, $a0
    addu        $v1, $v0, $zero
    slt         $v0, $v1, $a0
    beqz        $v0, .L800B7624
    sw          $v1, 0x98($s1)
    addu        $v1, $a0, $zero
.L800B7624:
    lui         $v0, 0x1E0
    slt         $v0, $v0, $v1
    beqz        $v0, .L800B7638
    sw          $v1, 0x98($s1)
    lui         $v1, 0x1E0
.L800B7638:
    sw          $v1, 0x98($s1)
.L800B763C:
    lui         $v0, 0x8009
    lw          $v0, -0x5A14($v0)
    lw          $v0, 0x1C($v0)
    lui         $a0, 0x8008
    lw          $a0, -0x5DC4($a0)
    lui         $a1, 0x8008
    lw          $a1, -0x5DE8($a1)
    bltzl       $v0, .L800B7670
    negu        $v0, $v0
    lui         $v1, 0x8008
    lw          $v1, -0x5DE0($v1)
    j           func_800B2F58
    srav        $v0, $v0, $a0
.L800B7670:
    lui         $v1, 0x8008
    lw          $v1, -0x5DE0($v1)
    srav        $v0, $v0, $a0
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00001012  # mflo        $v0
    addu        $v0, $a1, $v0
    lui         $v1, 0x8008
    lw          $v1, -0x5DD8($v1)
    sh          $v0, 0x68($s1)
    sltiu       $v0, $v1, 0x6
    beqz        $v0, .L800B76C0
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1618($at)
    jr          $v0
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x5DF0($v0)
    sh          $v0, 0x64($s1)
.L800B76C0:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B751C
