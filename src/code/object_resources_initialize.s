.text
.align 2
.set noreorder
.globl object_resources_initialize
.ent object_resources_initialize
object_resources_initialize:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $ra, 0x20($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lbu         $v0, 0x6($s2)
    lw          $s1, 0x8($s3)
    addiu       $s0, $zero, -0x81
    and         $v0, $v0, $s0
    bnez        $v0, .L8000F498
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x320
    lui         $at, 0x8006
    sw          $v0, 0x5460($at)
.L8000F498:
    lbu         $v0, 0x6($s2)
    and         $v0, $v0, $s0
    addiu       $v0, $v0, -0x1
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L8000F4D4
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x800
    lui         $at, 0x8006
    sw          $v0, 0x545C($at)
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addiu       $a2, $zero, 0x800
    jal         func_80033308
    addu        $a3, $zero, $zero
.L8000F4D4:
    addu        $a0, $zero, $zero
    addu        $a1, $s1, $zero
    addiu       $a2, $zero, 0x18
    jal         func_80033308
    addu        $a3, $zero, $zero
    lbu         $v0, 0x6($s2)
    sb          $v0, 0x8($s1)
    lhu         $a0, 0x0($s2)
    lhu         $a1, 0x4($s2)
    jal         func_80035D7C
    nop
    addu        $s0, $v0, $zero
    lhu         $a1, 0x0($s0)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $a1, -0x6
    sw          $v0, 0xC($s1)
    lhu         $a2, 0x0($s0)
    addu        $a0, $v0, $zero
    addiu       $a1, $s0, 0x6
    jal         func_8002E17C
    addiu       $a2, $a2, -0x6
    lw          $a1, 0xC($s1)
    addu        $a0, $zero, $zero
    andi        $v1, $a0, 0xFFFF
.L8000F538:
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    lhu         $v0, 0x0($v1)
    addiu       $a0, $a0, 0x1
    ori         $v0, $v0, 0x1
    sh          $v0, 0x0($v1)
    andi        $v0, $a0, 0xFFFF
    sltiu       $v0, $v0, 0x10
    bnez        $v0, .L8000F538
    andi        $v1, $a0, 0xFFFF
    lhu         $v0, 0x0($a1)
    lhu         $v1, 0x14($a1)
    andi        $v0, $v0, 0xFFFE
    andi        $v1, $v1, 0xFFFE
    sh          $v0, 0x0($a1)
    sh          $v1, 0x14($a1)
    lhu         $a0, 0x0($s2)
    lhu         $a1, 0x2($s2)
    jal         func_80035D7C
    nop
    addu        $s0, $v0, $zero
    lhu         $v0, 0x4($s0)
    sh          $v0, 0x0($s1)
    lhu         $v0, 0x6($s0)
    sh          $v0, 0x2($s1)
    lhu         $v1, 0x4($s0)
    beqz        $v1, .L8000F5C0
    addu        $a0, $zero, $zero
.L8000F5A8:
    srl         $v1, $v1, 1
    andi        $v0, $v1, 0xFFFF
    beql        $v0, $zero, .L8000F5C4
    sh          $a0, 0x4($s1)
    j .L8000F5A8
    addiu       $a0, $a0, 0x1
.L8000F5C0:
    sh          $a0, 0x4($s1)
.L8000F5C4:
    lhu         $v1, 0x6($s0)
    beqz        $v1, .L8000F5E8
    addu        $a0, $zero, $zero
.L8000F5D0:
    srl         $v1, $v1, 1
    andi        $v0, $v1, 0xFFFF
    beql        $v0, $zero, .L8000F5EC
    sh          $a0, 0x6($s1)
    j .L8000F5D0
    addiu       $a0, $a0, 0x1
.L8000F5E8:
    sh          $a0, 0x6($s1)
.L8000F5EC:
    lw          $a1, 0x0($s0)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $a1, -0x8
    sw          $v0, 0x10($s1)
    lw          $a2, 0x0($s0)
    addu        $a0, $v0, $zero
    addiu       $a1, $s0, 0x8
    jal         func_8002E17C
    addiu       $a2, $a2, -0x8
    lbu         $v0, 0x7($s2)
    sb          $zero, 0x14($s1)
    sb          $zero, 0x15($s1)
    sb          $v0, 0x9($s1)
    sw          $zero, 0x24($s3)
    sw          $zero, 0x20($s3)
    sw          $zero, 0x1C($s3)
    lhu         $a0, 0x0($s2)
    lhu         $a1, 0x4($s2)
    jal         func_80035F88
    nop
    lhu         $a0, 0x0($s2)
    lhu         $a1, 0x2($s2)
    jal         func_80035F88
    nop
    lbu         $v0, 0x8($s1)
    andi        $v0, $v0, 0x7F
    bnez        $v0, .L8000F7F4
    addiu       $a1, $zero, -0x1F40
    lui         $v0, 0x8006
    lw          $v0, 0x5460($v0)
    addiu       $a0, $zero, -0x898
    addiu       $v1, $zero, 0x7F
    addiu       $a2, $zero, 0x1F40
    sh          $zero, 0x0($v0)
    sh          $a1, 0x2($v0)
    sh          $a0, 0x4($v0)
    sb          $zero, 0xC($v0)
    sb          $zero, 0xD($v0)
    sb          $v1, 0xE($v0)
    sh          $a2, 0x10($v0)
    sh          $a1, 0x12($v0)
    sh          $a0, 0x14($v0)
    sb          $zero, 0x1C($v0)
    sb          $zero, 0x1D($v0)
    sb          $v1, 0x1E($v0)
    sh          $zero, 0x20($v0)
    sh          $zero, 0x22($v0)
    sh          $a0, 0x24($v0)
    sb          $zero, 0x2C($v0)
    sb          $zero, 0x2D($v0)
    sb          $v1, 0x2E($v0)
    sh          $a2, 0x30($v0)
    sh          $zero, 0x32($v0)
    sh          $a0, 0x34($v0)
    sb          $zero, 0x3C($v0)
    sb          $zero, 0x3D($v0)
    sb          $v1, 0x3E($v0)
    sh          $a1, 0x40($v0)
    sh          $a1, 0x42($v0)
    sh          $a0, 0x44($v0)
    sb          $zero, 0x4C($v0)
    sb          $zero, 0x4D($v0)
    sb          $v1, 0x4E($v0)
    sh          $zero, 0x50($v0)
    sh          $a1, 0x52($v0)
    sh          $a0, 0x54($v0)
    sb          $zero, 0x5C($v0)
    sb          $zero, 0x5D($v0)
    sb          $v1, 0x5E($v0)
    sh          $a1, 0x60($v0)
    sh          $zero, 0x62($v0)
    sh          $a0, 0x64($v0)
    sb          $zero, 0x6C($v0)
    sb          $zero, 0x6D($v0)
    sb          $v1, 0x6E($v0)
    sh          $zero, 0x70($v0)
    sh          $zero, 0x72($v0)
    sh          $a0, 0x74($v0)
    sb          $zero, 0x7C($v0)
    sb          $zero, 0x7D($v0)
    sb          $v1, 0x7E($v0)
    sh          $a1, 0x80($v0)
    sh          $zero, 0x82($v0)
    sh          $a0, 0x84($v0)
    sb          $zero, 0x8C($v0)
    sb          $zero, 0x8D($v0)
    sb          $v1, 0x8E($v0)
    sh          $zero, 0x90($v0)
    sh          $zero, 0x92($v0)
    sh          $a0, 0x94($v0)
    sb          $zero, 0x9C($v0)
    sb          $zero, 0x9D($v0)
    sb          $v1, 0x9E($v0)
    sh          $a1, 0xA0($v0)
    sh          $a2, 0xA2($v0)
    sh          $a0, 0xA4($v0)
    sb          $zero, 0xAC($v0)
    sb          $zero, 0xAD($v0)
    sb          $v1, 0xAE($v0)
    sh          $zero, 0xB0($v0)
    sh          $a2, 0xB2($v0)
    sh          $a0, 0xB4($v0)
    sb          $zero, 0xBC($v0)
    sb          $zero, 0xBD($v0)
    sb          $v1, 0xBE($v0)
    sh          $zero, 0xC0($v0)
    sh          $zero, 0xC2($v0)
    sh          $a0, 0xC4($v0)
    sb          $zero, 0xCC($v0)
    sb          $zero, 0xCD($v0)
    sb          $v1, 0xCE($v0)
    sh          $a2, 0xD0($v0)
    sh          $zero, 0xD2($v0)
    sh          $a0, 0xD4($v0)
    sb          $zero, 0xDC($v0)
    sb          $zero, 0xDD($v0)
    sb          $v1, 0xDE($v0)
    sh          $zero, 0xE0($v0)
    sh          $a2, 0xE2($v0)
    sh          $a0, 0xE4($v0)
    sb          $zero, 0xEC($v0)
    sb          $zero, 0xED($v0)
    sb          $v1, 0xEE($v0)
    sh          $a2, 0xF0($v0)
    sh          $a2, 0xF2($v0)
    sh          $a0, 0xF4($v0)
    sb          $zero, 0xFC($v0)
    sb          $zero, 0xFD($v0)
    sb          $v1, 0xFE($v0)
.L8000F7F4:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end object_resources_initialize
