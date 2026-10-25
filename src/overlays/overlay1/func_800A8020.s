.text
.align 2
.set noreorder
.globl func_800A8020
.ent func_800A8020
func_800A8020:
    addu        $at, $at, $v0
    lhu         $v0, -0x5818($at)
    sh          $v0, 0x20($sp)
    lh          $v1, 0xA($s0)
    addiu       $v0, $zero, 0x4
    beq         $v1, $v0, .L800A8098
    slti        $v0, $v1, 0x5
    beqz        $v0, .L800A8054
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800A8068
    nop
    j           func_800A39BC
    nop
.L800A8054:
    addiu       $v0, $zero, 0x6
    beq         $v1, $v0, .L800A80A4
    nop
    j           func_800A39BC
    nop
.L800A8068:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L800A80E0
    nop
    sh          $zero, 0x4C($s0)
    sh          $zero, 0x4E($s0)
    sh          $zero, 0x50($s0)
    sh          $zero, 0x54($s0)
    sh          $zero, 0x56($s0)
    j           func_800A39BC
    sh          $zero, 0x58($s0)
.L800A8098:
    addiu       $v0, $zero, 0x6
    j           func_800A39BC
    sh          $v0, 0x56($s0)
.L800A80A4:
    lw          $v1, 0x18($s0)
    bgez        $v1, .L800A80B4
    addu        $v0, $v1, $zero
    addiu       $v0, $v1, 0x3
.L800A80B4:
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0xEE
    sra         $v0, $v0, 2
    addu        $v0, $v1, $v0
    addiu       $a2, $zero, 0x11
    jal         func_800A6A70
    sw          $v0, 0x18($s0)
    lw          $v1, 0xA0($s0)
    lhu         $v0, 0x24($sp)
    addu        $v0, $v0, $v1
    sh          $v0, 0x24($sp)
.L800A80E0:
    lw          $v0, 0xC($s0)
.end func_800A8020
