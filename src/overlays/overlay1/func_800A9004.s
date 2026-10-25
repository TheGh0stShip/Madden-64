.text
.align 2
.set noreorder
.globl func_800A9004
.ent func_800A9004
func_800A9004:
    lui         $t0, 0x8009
    addiu       $t0, $t0, -0x6A68
    addiu       $a3, $zero, -0x1
.L800A9010:
    sll         $v0, $a2, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $t1
    lw          $v0, 0x0($v0)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t0
    lh          $v1, 0x0($v0)
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    beq         $v1, $v0, .L800A9048
    addu        $a0, $v1, $zero
    bne         $v0, $a3, .L800A9048
    addiu       $a1, $zero, 0x2
    addu        $a1, $a0, $zero
.L800A9048:
    addiu       $v0, $a2, 0x1
    sll         $v1, $v0, 16
    sra         $v1, $v1, 14
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v1, -0x6B70($at)
    bne         $v1, $a3, .L800A9010
    addu        $a2, $v0, $zero
    lui         $v0, 0xFE40
    sw          $v0, 0xB0($s0)
    lui         $v0, 0x1C0
    sw          $v0, 0xB4($s0)
    lui         $v0, 0xFB10
    sw          $v0, 0xB8($s0)
    lui         $v0, 0x4F0
    sw          $v0, 0xBC($s0)
    sll         $v0, $a1, 16
    sra         $v1, $v0, 16
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800A90AC
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $v1, $v0, .L800A90BC
    addiu       $v0, $zero, 0x2
.L800A90AC:
    jal         func_800A4790
    addu        $a0, $s0, $zero
    j           func_800A4ABC
    nop
.L800A90BC:
    bne         $v1, $v0, .L800A90D8
    addiu       $v0, $zero, 0x4
    addu        $a0, $s0, $zero
    jal         func_800A6590
    addiu       $a1, $zero, 0x1
    j           func_800A4ABC
    nop
.L800A90D8:
    lw          $a0, 0x14($s0)
    addiu       $v1, $zero, 0x7
    sh          $v0, 0x4C($s0)
    sh          $v0, 0x4E($s0)
    sh          $v0, 0x50($s0)
    sh          $v0, 0x74($s0)
    sh          $v0, 0x76($s0)
    sh          $v0, 0x78($s0)
    addiu       $v0, $zero, 0x5
    sh          $v1, 0x54($s0)
    sh          $v1, 0x56($s0)
    sh          $v1, 0x58($s0)
    sh          $v0, 0x7C($s0)
    sh          $v0, 0x7E($s0)
    jal         func_8000C8EC
    sh          $v0, 0x80($s0)
    beqz        $v0, .L800A9128
    addiu       $v0, $zero, 0x7FF
    j           func_800A4A08
    sh          $zero, 0x24($sp)
.L800A9128:
    sh          $v0, 0x24($sp)
    lh          $v1, 0xA($s0)
    addiu       $a0, $zero, 0x3
    beql        $v1, $a0, .L800A9150
    sh          $zero, 0x4C($s0)
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4E($v0)
    bne         $v0, $a0, . + 4 + (0x8 << 2)
    addiu       $v0, $zero, 0x6
    sh          $zero, 0x4C($s0)
.L800A9150:
    sh          $zero, 0x4E($s0)
.end func_800A9004
