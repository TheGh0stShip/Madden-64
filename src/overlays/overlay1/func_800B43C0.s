.text
.align 2
.set noreorder
.globl func_800B43C0
.ent func_800B43C0
func_800B43C0:
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0xF($v0)
    sb          $s7, 0xD0($sp)
    lhu         $v0, 0x10($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x12($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0xE($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x10($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0x12($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0xE($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0xF4($sp)
    .word       0x00560019  # multu       $v0, $s6
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    addu        $v1, $v1, $s2
    .word       0x00004010  # mfhi        $t0
    srl         $v0, $t0, 1
    sh          $v0, 0x10($v1)
    lbu         $v0, 0xF2($sp)
    sb          $v0, 0x12($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x13($v0)
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    lhu         $v0, 0x2A($s0)
    addu        $v1, $v1, $s2
    sh          $v0, 0x14($v1)
    lhu         $v0, 0x2A($s1)
    sb          $v0, 0x16($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lhu         $v1, 0x2A($s1)
    addu        $v0, $v0, $s2
    sb          $v1, 0x17($v0)
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    lhu         $v0, 0x6($s0)
    addu        $v1, $v1, $s2
    sh          $v0, 0x18($v1)
    lhu         $v0, 0x6($s1)
    sb          $v0, 0x1A($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lhu         $v1, 0x6($s1)
    lui         $a2, 0x2AAA
    addu        $v0, $v0, $s2
    sb          $v1, 0x1B($v0)
    lhu         $v0, 0xA($s0)
    lhu         $v1, 0xC($s0)
    lhu         $a0, 0xE($s0)
    ori         $a2, $a2, 0xAAAB
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a0
    lhu         $v1, 0x10($s0)
    lhu         $a0, 0x12($s0)
    lhu         $a1, 0x8($s0)
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a0
    addu        $v0, $v0, $a1
    .word       0x00460018  # mult        $v0, $a2
    lui         $a1, 0x5555
    ori         $a1, $a1, 0x5556
    sra         $v0, $v0, 31
    lhu         $v1, 0x2($s0)
    lhu         $a0, 0x4($s0)
    .word       0x00004010  # mfhi        $t0
    subu        $v0, $t0, $v0
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a0
    .word       0x00450018  # mult        $v0, $a1
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    sra         $v0, $v0, 31
    addu        $v1, $v1, $s2
    .word       0x00004010  # mfhi        $t0
    subu        $v0, $t0, $v0
    sh          $v0, 0x1C($v1)
    addiu       $v0, $zero, 0x8
    sb          $v0, 0xD0($sp)
    lhu         $v0, 0xA($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0xC($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0xE($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x10($s1)
    sb          $v0, 0xD4($sp)
    lhu         $v0, 0x12($s1)
    sb          $v0, 0xD5($sp)
    lhu         $v0, 0x8($s1)
    sb          $v0, 0xD6($sp)
    lhu         $v0, 0x2($s1)
    sb          $v0, 0xD7($sp)
    lhu         $v0, 0x4($s1)
    sb          $v0, 0xD8($sp)
    lhu         $v0, 0xA($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0xC($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0xE($s0)
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0x10($s0)
    sh          $v0, 0xE2($sp)
    lhu         $v0, 0x12($s0)
    sh          $v0, 0xE4($sp)
    lhu         $v0, 0x8($s0)
    sh          $v0, 0xE6($sp)
    lhu         $v0, 0x2($s0)
    sh          $v0, 0xE8($sp)
    lhu         $v0, 0x4($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xEA($sp)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF2($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x1E($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x1F($v0)
    addiu       $t0, $zero, 0x1
    sb          $t0, 0xD0($sp)
    lhu         $v0, 0x2($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x2($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xDC($sp)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF2($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x4A($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x4B($v0)
    addiu       $t0, $zero, 0x1
    sb          $t0, 0xD0($sp)
    lhu         $v0, 0x0($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x0($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xDC($sp)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF2($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x4E($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x4F($v0)
    lhu         $v0, 0xA($s0)
    lhu         $v1, 0xC($s0)
    addu        $v0, $v0, $v1
    lhu         $v1, 0xE($s0)
    lhu         $a0, 0x10($s0)
    lhu         $a1, 0x12($s0)
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a0
    addu        $v0, $v0, $a1
    .word       0x005E0018  # mult        $v0, $fp
    lui         $a2, 0x8007
    lw          $a2, -0x158C($a2)
    sra         $v0, $v0, 31
    .word       0x00004010  # mfhi        $t0
    sra         $v1, $t0, 1
    subu        $v1, $v1, $v0
    lhu         $v0, 0x8($s0)
    lhu         $a0, 0x2($s0)
    lhu         $a1, 0x4($s0)
    addu        $v1, $v1, $v0
    addu        $v1, $v1, $a0
    addu        $v1, $v1, $a1
    lhu         $a0, 0x6($s0)
    lhu         $a1, 0x2A($s0)
    lhu         $v0, 0x0($s0)
    addu        $v1, $v1, $a0
    addu        $v1, $v1, $a1
    sll         $v0, $v0, 1
    addu        $v0, $v1, $v0
    bgez        $v0, .L800B46E8
    addu        $a2, $a2, $s2
    addiu       $v0, $v0, 0x7
.L800B46E8:
    sra         $v0, $v0, 3
    sh          $v0, 0x20($a2)
    addiu       $v0, $zero, 0xB
    sb          $v0, 0xD0($sp)
    lhu         $v0, 0xA($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0xC($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0xE($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x10($s1)
    sb          $v0, 0xD4($sp)
    lhu         $v0, 0x12($s1)
    sb          $v0, 0xD5($sp)
    lhu         $v0, 0x8($s1)
    sb          $v0, 0xD6($sp)
    lhu         $v0, 0x2($s1)
    sb          $v0, 0xD7($sp)
    lhu         $v0, 0x4($s1)
    sb          $v0, 0xD8($sp)
    lhu         $v0, 0x6($s1)
    sb          $v0, 0xD9($sp)
    lhu         $v0, 0x2A($s1)
    sb          $v0, 0xDA($sp)
    lhu         $v0, 0x0($s1)
    sb          $v0, 0xDB($sp)
    lhu         $v0, 0xA($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0xC($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0xE($s0)
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0x10($s0)
    sh          $v0, 0xE2($sp)
    lhu         $v0, 0x12($s0)
    sh          $v0, 0xE4($sp)
    lhu         $v0, 0x8($s0)
    sh          $v0, 0xE6($sp)
    lhu         $v0, 0x2($s0)
    sh          $v0, 0xE8($sp)
    lhu         $v0, 0x4($s0)
    sh          $v0, 0xEA($sp)
    lhu         $v0, 0x6($s0)
    sh          $v0, 0xEC($sp)
    lhu         $v0, 0x2A($s0)
    sh          $v0, 0xEE($sp)
    lhu         $v0, 0x0($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xF0($sp)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF2($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x22($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x23($v0)
    sb          $s7, 0xD0($sp)
    lhu         $v0, 0x2C($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x16($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0x20($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x2C($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0x16($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0x20($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0xF4($sp)
    .word       0x00560019  # multu       $v0, $s6
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    addu        $v1, $v1, $s2
    .word       0x00004810  # mfhi        $t1
    srl         $v0, $t1, 1
    sh          $v0, 0x24($v1)
    lbu         $v0, 0xF2($sp)
    sb          $v0, 0x26($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x27($v0)
    sb          $s7, 0xD0($sp)
    lhu         $v0, 0x18($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x2C($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0x1C($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x18($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0x2C($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0x1C($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0xF4($sp)
    .word       0x00560019  # multu       $v0, $s6
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    addu        $v1, $v1, $s2
    .word       0x00004810  # mfhi        $t1
    srl         $v0, $t1, 1
    sh          $v0, 0x28($v1)
    lbu         $v0, 0xF2($sp)
    sb          $v0, 0x2A($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x2B($v0)
    sb          $s7, 0xD0($sp)
    lhu         $v0, 0x18($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x14($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0x1A($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x18($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0x14($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0x1A($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0xF4($sp)
    .word       0x00560019  # multu       $v0, $s6
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    addu        $v1, $v1, $s2
    .word       0x00004810  # mfhi        $t1
    srl         $v0, $t1, 1
    sh          $v0, 0x2C($v1)
    lbu         $v0, 0xF2($sp)
    sb          $v0, 0x2E($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x2F($v0)
    sb          $s7, 0xD0($sp)
    lhu         $v0, 0x20($s1)
    sb          $v0, 0xD1($sp)
    lhu         $v0, 0x1C($s1)
    sb          $v0, 0xD2($sp)
    lhu         $v0, 0x1A($s1)
    sb          $v0, 0xD3($sp)
    lhu         $v0, 0x20($s0)
    sh          $v0, 0xDC($sp)
    lhu         $v0, 0x1C($s0)
    sh          $v0, 0xDE($sp)
    lhu         $v0, 0x1A($s0)
    addu        $a0, $s3, $zero
    jal         func_800B07E4
    sh          $v0, 0xE0($sp)
    lhu         $v0, 0xF4($sp)
    .word       0x00560019  # multu       $v0, $s6
    lui         $v1, 0x8007
.end func_800B43C0
