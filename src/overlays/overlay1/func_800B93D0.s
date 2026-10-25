.text
.align 2
.set noreorder
.globl func_800B93D0
.ent func_800B93D0
func_800B93D0:
    lw          $a3, 0x6178($a3)
    lw          $v0, 0x3C0($a1)
    lw          $a0, 0x47C($a1)
    lui         $a2, 0x8008
    lw          $a2, 0x7B54($a2)
    sw          $v0, 0x1C($a3)
    lw          $v0, 0x3C4($a1)
    sw          $v0, 0x20($a3)
    lw          $v0, 0x3C8($a1)
    sw          $v0, 0x24($a3)
    lhu         $v0, 0x3D0($a1)
    lui         $at, 0x8008
    sh          $v0, 0x76E0($at)
    lhu         $v0, 0x3D2($a1)
    lui         $at, 0x8008
    sh          $v0, 0x76E2($at)
    lhu         $v0, 0x3D4($a1)
    lui         $at, 0x8008
    sh          $v0, 0x76E4($at)
    lw          $v0, 0x1C($a3)
    lw          $v1, 0x8($a2)
    sw          $v0, 0x1C($a2)
    lw          $v0, 0x20($a3)
    sw          $v0, 0x20($a2)
    lui         $v0, 0x8008
    lhu         $v0, 0x76E2($v0)
    lui         $at, 0x8009
    sw          $a0, -0x5FA8($at)
    addiu       $v0, $v0, 0x400
    sh          $v0, 0x12($v1)
    lb          $v1, 0x3D8($a1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B9470
    addiu       $v1, $zero, -0x2
    lw          $v0, 0x14($a3)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($a3)
    lw          $v0, 0x14($a2)
    j           func_800B4D60
    ori         $v0, $v0, 0x1
.L800B9470:
    lw          $v0, 0x14($a3)
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a3)
    lw          $v0, 0x14($a2)
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a2)
    addu        $s2, $zero, $zero
.L800B948C:
    lui         $v0, 0x8008
    lw          $v0, 0x7128($v0)
    sll         $v1, $s2, 16
    sra         $v1, $v1, 16
    addu        $v0, $v0, $v1
    lbu         $a0, 0x3D9($v0)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x9
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $a0, 0x5E50($at)
    bnez        $v0, .L800B948C
    nop
    lui         $v0, 0x8009
    lb          $v0, -0x7F8A($v0)
    sll         $v0, $v0, 1
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lh          $v0, -0x6CF8($at)
    lui         $a0, 0x8008
    lw          $a0, 0x6C60($a0)
    sll         $v0, $v0, 1
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lhu         $a1, -0x4E08($at)
    jal         func_80096A00
    addiu       $s2, $zero, 0x7
    lui         $a0, 0x8008
    lw          $a0, 0x7128($a0)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x7AD0
.L800B9514:
    sll         $v0, $s2, 16
    sra         $v1, $v0, 16
    addu        $v0, $a0, $v1
    lb          $v0, 0x3E2($v0)
    beqz        $v0, .L800B9548
    addu        $v0, $s2, $zero
    sll         $v0, $v1, 2
    addu        $v0, $v0, $a1
    lw          $v1, 0x0($v0)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    addu        $v0, $s2, $zero
.L800B9548:
    sll         $v0, $v0, 16
    bnez        $v0, .L800B9514
    addiu       $s2, $s2, -0x1
.end func_800B93D0
