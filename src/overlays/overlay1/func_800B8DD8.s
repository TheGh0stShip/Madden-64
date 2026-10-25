.text
.align 2
.set noreorder
.globl func_800B8DD8
.ent func_800B8DD8
func_800B8DD8:
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnez        $v0, . + 4 + (-0x2C << 2)
    sw          $v1, 0x18($s0)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $v0, 0x1C($v1)
    addu        $a0, $a1, $zero
    sw          $v0, 0x3C0($a0)
    lw          $v0, 0x20($v1)
    sw          $v0, 0x3C4($a0)
    lw          $v0, 0x24($v1)
    sw          $v0, 0x3C8($a0)
    lui         $v0, 0x8008
    lhu         $v0, 0x76E0($v0)
    sh          $v0, 0x3D0($a0)
    lui         $v0, 0x8008
    lhu         $v0, 0x76E2($v0)
    sh          $v0, 0x3D2($a0)
    lui         $v0, 0x8008
    lhu         $v0, 0x76E4($v0)
    sh          $v0, 0x3D4($a0)
    lw          $v0, 0x14($v1)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800B8E48
    addiu       $v0, $zero, 0x1
    j           func_800B4728
    sb          $v0, 0x3D8($a0)
.L800B8E48:
    sb          $zero, 0x3D8($a1)
    lui         $v0, 0x8009
    lw          $v0, -0x791C($v0)
    lw          $v0, 0x14($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800B8E74
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    j           func_800B475C
    sb          $v0, 0x3EB($v1)
.L800B8E74:
    lui         $v0, 0x8008
    lw          $v0, 0x7128($v0)
    sb          $zero, 0x3EB($v0)
    lui         $v0, 0x8009
    lw          $v0, -0x791C($v0)
    lw          $v1, 0x14($v0)
    addu        $s2, $zero, $zero
    addiu       $a0, $zero, -0x2
    and         $v1, $v1, $a0
    sw          $v1, 0x14($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x7128($a0)
    sll         $v1, $s2, 16
    sra         $v1, $v1, 16
    lui         $at, 0x8008
.end func_800B8DD8
