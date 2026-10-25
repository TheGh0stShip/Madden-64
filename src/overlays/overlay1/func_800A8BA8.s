.text
.align 2
.set noreorder
.globl func_800A8BA8
.ent func_800A8BA8
func_800A8BA8:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x28($sp)
    addu        $s0, $a0, $zero
    addiu       $v1, $zero, 0x4
    addiu       $v0, $zero, 0x7
    sw          $ra, 0x2C($sp)
    sh          $v0, 0x54($s0)
    sh          $v0, 0x56($s0)
    sh          $v0, 0x58($s0)
    addiu       $v0, $zero, 0x5
    sh          $v1, 0x4C($s0)
    sh          $v1, 0x4E($s0)
    sh          $v1, 0x50($s0)
    sh          $v1, 0x74($s0)
    sh          $v1, 0x76($s0)
    sh          $v1, 0x78($s0)
    sh          $v0, 0x7C($s0)
    sh          $v0, 0x7E($s0)
    sh          $v0, 0x80($s0)
    sh          $zero, 0x22($sp)
    lw          $v0, 0xC($s0)
    lw          $v0, 0x1C($v0)
    sw          $v0, 0x10($sp)
    lw          $a0, 0x14($s0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A8C20
    addiu       $v0, $zero, 0x7FF
    j           func_800A4500
    sh          $v0, 0x24($sp)
.L800A8C20:
    sh          $zero, 0x24($sp)
    lh          $v1, 0xA($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x5820($at)
    lh          $v1, 0xA($s0)
    sw          $v0, 0x18($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x581C($at)
    sw          $v0, 0x18($sp)
    lh          $v1, 0xA($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $v0, -0x5818($at)
    sh          $v0, 0x20($sp)
    lh          $v1, 0xA($s0)
    sltiu       $v0, $v1, 0xD
    beqz        $v0, . + 4 + (0x47 << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xD20($at)
    jr          $v0
    nop
.end func_800A8BA8
