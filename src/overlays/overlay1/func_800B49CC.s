.text
.align 2
.set noreorder
.globl func_800B49CC
.ent func_800B49CC
func_800B49CC:
    lbu         $v1, 0x25($s1)
    sb          $v1, 0x37($v0)
    sb          $v1, 0x36($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lhu         $v1, 0x22($s0)
    addu        $v0, $v0, $s2
    sh          $v1, 0x38($v0)
    lbu         $v1, 0x23($s1)
    sb          $v1, 0x3B($v0)
    sb          $v1, 0x3A($v0)
    addiu       $v0, $zero, 0x2
    sb          $v0, 0xD0($sp)
    lhu         $v0, 0x26($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x28($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0x26($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0x28($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xDE($sp)
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    lhu         $v0, 0xF4($sp)
    addu        $v1, $v1, $s2
    srl         $v0, $v0, 1
    sh          $v0, 0x3C($v1)
    lbu         $v0, 0xF2($sp)
    sb          $v0, 0x3E($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x3F($v0)
    addiu       $t0, $zero, 0x7
    sb          $t0, 0xD0($sp)
    lhu         $v0, 0x18($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x2C($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0x14($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x16($s1)
    sb          $v0, 0xD4($sp)
    lhu         $v0, 0x20($s1)
    sb          $v0, 0xD5($sp)
    lhu         $v0, 0x1A($s1)
    sb          $v0, 0xD6($sp)
    lhu         $v0, 0x1C($s1)
    sb          $v0, 0xD7($sp)
    lhu         $v0, 0x18($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0x2C($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0x14($s0)
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0x16($s0)
    sh          $v0, 0xE2($sp)
    lhu         $v0, 0x20($s0)
    sh          $v0, 0xE4($sp)
    lhu         $v0, 0x1A($s0)
    sh          $v0, 0xE6($sp)
    lhu         $v0, 0x1C($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xE8($sp)
    lhu         $v1, 0xF4($sp)
    lui         $v0, 0x2492
    ori         $v0, $v0, 0x4925
    .word       0x00620019  # multu       $v1, $v0
    lui         $a0, 0x8007
    lw          $a0, -0x158C($a0)
    addu        $a0, $a0, $s2
    .word       0x00001010  # mfhi        $v0
    subu        $v1, $v1, $v0
    srl         $v1, $v1, 1
    addu        $v0, $v0, $v1
    srl         $v0, $v0, 2
    sh          $v0, 0x40($a0)
    lbu         $v0, 0xF2($sp)
    sb          $v0, 0x42($a0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x43($v0)
    lui         $a2, 0x8007
    lw          $a2, -0x158C($a2)
    lhu         $v1, 0x24($s0)
    addu        $a2, $a2, $s2
    lh          $v0, 0x30($a2)
    addu        $v0, $v0, $v1
    lhu         $v1, 0x22($s0)
    lhu         $a0, 0x26($s0)
    lhu         $a1, 0x28($s0)
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a0
    addu        $v0, $v0, $a1
    .word       0x005E0018  # mult        $v0, $fp
    sra         $v0, $v0, 31
    .word       0x00001810  # mfhi        $v1
    sra         $v1, $v1, 1
    subu        $v1, $v1, $v0
    sh          $v1, 0x44($a2)
    addiu       $t0, $zero, 0x7
    sb          $t0, 0xD0($sp)
    lhu         $v0, 0x20($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x1A($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0x1C($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x24($s1)
    sb          $v0, 0xD4($sp)
    lhu         $v0, 0x22($s1)
    sb          $v0, 0xD5($sp)
    lhu         $v0, 0x28($s1)
    sb          $v0, 0xD6($sp)
    lhu         $v0, 0x26($s1)
    sb          $v0, 0xD7($sp)
    lhu         $v0, 0x20($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0x1A($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0x1C($s0)
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0x24($s0)
    sh          $v0, 0xE2($sp)
    lhu         $v0, 0x22($s0)
    sh          $v0, 0xE4($sp)
    lhu         $v0, 0x28($s0)
    sh          $v0, 0xE6($sp)
    lhu         $v0, 0x26($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xE8($sp)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF2($sp)
    addiu       $s4, $s4, 0x2E
    addu        $v0, $v0, $s2
    sb          $v1, 0x46($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addiu       $s5, $s5, 0x1
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x47($v0)
    sltiu       $v0, $s5, 0x2
    bnez        $v0, . + 4 + (-0x258 << 2)
    addiu       $s2, $s2, 0x48
    jal         func_800B0548
    nop
    lw          $ra, 0x11C($sp)
    lw          $fp, 0x118($sp)
    lw          $s7, 0x114($sp)
    lw          $s6, 0x110($sp)
    lw          $s5, 0x10C($sp)
    lw          $s4, 0x108($sp)
    lw          $s3, 0x104($sp)
    lw          $s2, 0x100($sp)
    lw          $s1, 0xFC($sp)
    lw          $s0, 0xF8($sp)
    addiu       $sp, $sp, 0x120
    jr          $ra
    nop
.end func_800B49CC
