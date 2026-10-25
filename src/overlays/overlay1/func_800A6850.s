.text
.align 2
.set noreorder
.globl func_800A6850
.ent func_800A6850
func_800A6850:
    lui         $v1, 0x8008
    lb          $v1, 0x7B50($v1)
    bltz        $v1, .L800A6884
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sb          $zero, -0x7B78($at)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sb          $zero, -0x7EF0($at)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sb          $v0, -0x4870($at)
.L800A6884:
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0xC00
    jal         func_800C0018
    addu        $a2, $zero, $zero
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    jal         func_800B8C90
    addu        $a0, $s1, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x7FA0
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x6
    sw          $v0, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $v1, 0x1C($sp)
    lw          $a0, 0x1C($s1)
    lw          $a1, 0x20($s1)
    lw          $a2, 0x24($s1)
    lw          $a3, 0x28($s1)
    jal         func_8009F1DC
    nop
    lw          $v1, 0x1C($s1)
    lui         $v0, 0xFE00
    slt         $v0, $v1, $v0
    beqz        $v0, . + 4 + (0x46 << 2)
    lui         $a1, 0x2E
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $v0, 0x24($v0)
    sw          $v1, 0x1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7FA0($v1)
    lw          $v0, 0x20($s1)
    lw          $a0, 0x24($v1)
    lui         $v1, 0xFFFC
    addu        $v0, $v0, $v1
    sw          $v0, 0x20($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $v1, 0x24($v0)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x5
    sw          $v0, 0x14($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    lui         $v1, 0xFFFD
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lw          $a0, 0x0($s0)
    jal         func_800C0BBC
    ori         $a1, $a1, 0x3
    addiu       $v0, $zero, 0x7
    lui         $at, 0x8008
    sw          $v0, 0x7FA4($at)
    jal         func_800A365C
    addiu       $a0, $zero, 0x1
    j           func_800A22E0
    nop
.end func_800A6850
