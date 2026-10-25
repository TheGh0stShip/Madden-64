.text
.align 2
.set noreorder
.globl func_800BD4FC
.ent func_800BD4FC
func_800BD4FC:
    lw          $v0, 0x14($a0)
    andi        $v0, $v0, 0x20
    beqz        $v0, .L800BD5CC
    nop
    lw          $v0, 0x24($a0)
    bnez        $v0, .L800BD5CC
    nop
    lhu         $v0, 0x3C($a0)
    addiu       $a2, $v0, -0x17C
    bgezl       $a2, .L800BD528
    addiu       $a2, $zero, -0x1
.L800BD528:
    andi        $v0, $a1, 0xFFFF
    .word       0x00C20018  # mult        $a2, $v0
    .word       0x00003012  # mflo        $a2
    lui         $v0, 0x8008
    lw          $v0, 0x7B64($v0)
    .word       0x00C20018  # mult        $a2, $v0
    .word       0x00001012  # mflo        $v0
    lw          $v1, 0x2C($a0)
    beqz        $v1, .L800BD588
    sra         $a2, $v0, 16
    .word       0x00660018  # mult        $v1, $a2
    .word       0x00001012  # mflo        $v0
    sra         $v0, $v0, 11
    addu        $v1, $v1, $v0
    blez        $v1, .L800BD574
    sw          $v1, 0x2C($a0)
    lw          $v0, 0x44($a0)
    j           func_800B8E5C
    slt         $v0, $v1, $v0
.L800BD574:
    lw          $v0, 0x44($a0)
    negu        $v0, $v0
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L800BD588
    sw          $zero, 0x2C($a0)
.L800BD588:
    lw          $v1, 0x30($a0)
    beqz        $v1, .L800BD5CC
    nop
    .word       0x00660018  # mult        $v1, $a2
    .word       0x00001012  # mflo        $v0
    sra         $v0, $v0, 11
    addu        $v1, $v1, $v0
    blez        $v1, .L800BD5B8
    sw          $v1, 0x30($a0)
    lw          $v0, 0x44($a0)
    j           func_800B8EA0
    slt         $v0, $v1, $v0
.L800BD5B8:
    lw          $v0, 0x44($a0)
    negu        $v0, $v0
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L800BD5CC
    sw          $zero, 0x30($a0)
.L800BD5CC:
    jr          $ra
    nop
.end func_800BD4FC
