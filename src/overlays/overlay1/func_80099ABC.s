.text
.align 2
.set noreorder
.globl func_80099ABC
.ent func_80099ABC
func_80099ABC:
    addiu       $a1, $zero, 0x1
    lw          $v0, 0x20($s1)
    sh          $zero, 0x58($s1)
    lbu         $v0, 0x6($v0)
    andi        $v0, $v0, 0x40
    beqz        $v0, .L80099ADC
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x58($s1)
.L80099ADC:
    addiu       $v0, $zero, 0x800
    sh          $zero, 0x8($s1)
    sh          $zero, 0xA($s1)
    sh          $zero, 0xE($s1)
    sh          $zero, 0x68($s1)
    sh          $zero, 0x10($s1)
    sw          $v0, 0x28($s1)
    lh          $v0, 0x18($s3)
    sw          $v0, 0x38($s1)
    lh          $v0, 0x1C($s3)
    sw          $v0, 0x3C($s1)
    lh          $v0, 0x20($s3)
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0x1
    sw          $v0, 0x40($s1)
    addiu       $v0, $zero, 0x1
    sw          $zero, 0x34($s2)
    sw          $zero, 0x30($s2)
    sw          $zero, 0x2C($s2)
    sw          $v0, 0x14($s2)
    jal         func_80033B20
    sw          $zero, 0x70($s1)
    lw          $v0, 0x18($s2)
    lw          $v1, 0x1C($s1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    lhu         $v0, 0x0($v0)
    addu        $a0, $s2, $zero
    jal         func_800954E0
    sh          $v0, 0x60($s1)
    lhu         $v1, 0x54($s2)
    addiu       $v0, $zero, 0xB
    bne         $v1, $v0, .L80099BC8
    nop
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x80
    addu        $a0, $zero, $zero
    addu        $s0, $v0, $zero
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0x80
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $s0, 0x7C($s1)
    addiu       $a1, $zero, 0x7
    addiu       $a0, $zero, 0xFF
    addiu       $v1, $s0, 0x70
    addiu       $s0, $s0, 0x40
    sw          $s0, 0x80($s1)
.L80099BA0:
    sh          $zero, 0x4($v1)
    sh          $zero, 0x6($v1)
    sb          $a0, 0xF($v1)
    sb          $a0, 0xE($v1)
    sb          $a0, 0xD($v1)
    sb          $a0, 0xC($v1)
    addiu       $v1, $v1, -0x10
    addu        $v0, $a1, $zero
    bnez        $v0, .L80099BA0
    addiu       $a1, $a1, -0x1
.L80099BC8:
    lw          $v1, 0x2C($s3)
    beqz        $v1, . + 4 + (0x5 << 2)
    nop
.end func_80099ABC
